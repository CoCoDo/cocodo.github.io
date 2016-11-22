#!/c/Users/vadim/AppData/Local/Programs/Python/Python35/python
# -*- coding: utf-8 -*-

import glob, datetime, json

d = ('Zeroary', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',\
	'September', 'October', 'November', 'December')[datetime.date.today().month]+\
	' '+str(datetime.date.today().year)
langorder = ["en", "nl", "fr", "de", "ru"]
lang = {"en": "English", "de": "German", "nl": "Dutch", "fr": "French", "ru": "Russian"}
techs = {
	"AG": "https://en.wikipedia.org/wiki/Attribute_grammar",
	"ALL(*)": "http://www.antlr.org/papers/allstar-techreport.pdf",
	"BX": "http://www.prg.nii.ac.jp/project/bigul/",
	"DCG": "https://pdfs.semanticscholar.org/fbc0/4a1951003ba164303b2898fb7f3c6b4e9083.pdf",
	"GLR": "https://en.wikipedia.org/wiki/GLR_parser",
	"LALR": "https://en.wikipedia.org/wiki/LALR_parser",
	"LALR(1)": "https://en.wikipedia.org/wiki/LALR_parser",
}
slang = {
	"C": "http://101companies.org/wiki/Language:C",
	"C#": "http://101companies.org/wiki/Language:CSharp",
	"C++": "http://101companies.org/wiki/Language:CPlusPlus",
	"Haskell": "http://101companies.org/wiki/Language:Haskell",
	"Java": "http://101companies.org/wiki/Language:Java",
	"JavaScript": "http://101companies.org/wiki/Language:JavaScript",
	"Prolog": "http://101companies.org/wiki/Language:Prolog",
	"Python2": "https://docs.python.org/2/",
	"Python3": "https://docs.python.org/3/",
}

def bare(s):
	if s.startswith('https://github.com/') or s.startswith('http://github.com/'):
		return '@%s/%s' % (s.split('/')[3], s.split('/')[4])
	else:
		return s.split('/')[2].replace('www.','')

def resolve(s,l):
	if not l:
		l = s
		s = bare(l)
	return '<a href="%s">%s</a>' % (l,s)

def tryresolve(s, d):
	if s in d.keys():
		return resolve(s,d[s])
	else:
		return s

def sortlangs(l):
	inp = list(l)
	outp = []
	for x in langorder:
		if x in inp:
			inp.remove(x)
			outp.append(x)
	outp.extend(inp)
	return outp

print('Processing...')
with open('index.dsl',  'r', encoding='utf-8') as f:
	lines = f.readlines()
g = open('index.html', 'w', encoding='utf-8')
i = 0
while i < len(lines):
	# skip comments
	if lines[i].strip().startswith('<!--'):
		while not lines[i].strip().endswith('-->'):
			i += 1
		i += 1
	# skip empty lines
	if not lines[i].strip():
		i += 1
		# to be on the safe side of the boundary bug
		continue
	if lines[i].strip().startswith('<tab>') and lines[i].strip().endswith('</tab>'):
		macro = lines[i].strip()[5:-6]
		print('Expanding %s...' % macro)
		with open('tech-'+macro.lower()+'.json', 'r', encoding='utf-8') as f:
			m = json.load(f)
			if 'logo' in m.keys():
				logo = resolve('<img src="logo/%s" alt="%s" width="150px"/></a>' % (m['logo'], macro), m['uri'])
			elif 'fullname' in m.keys():
				logo = m['fullname']
			else:
				logo = macro
			if 'toolname' in m.keys():
				tool = m['toolname']
			else:
				tool = macro
			items = [tool]
			items.append('Main website: <a href="%s">%s</a>' % (m['uri'], bare(m['uri'])))
			if 'version' in m.keys():
				items[0] += ' version %s' % m['version']
			if 'lang' in m.keys():
				item = 'Works with ' + ', '.join([tryresolve(l,slang) for l in m['lang']])
				items.append(item)
			if 'wikipedia' in m.keys():
				item = 'Wikipedia: '
				bylang = {}
				for k in m['wikipedia'].keys():
					for v in m['wikipedia'][k]:
						bylang[v] = '(<a href="https://%s.wikipedia.org/wiki/%s">%s</a>)' % (v,k,lang[v])
				item += ' '.join([bylang[x] for x in sortlangs(bylang.keys())])
				items.append(item)
			if 'download' in m.keys():
				items[0] += ' (<a href="%s">download</a>)' % m['download']
			if 'parsing' in m.keys():
				if len(m['parsing']) == 1:
					item = 'Parsing algorithm: ' + tryresolve(m['parsing'][0],techs)
				else:
					item = 'Parsing algorithms: ' + ', '.join([tryresolve(a,techs) for a in m['parsing']])
				items.append(item)
			if 'example' in m.keys():
				item = 'Example'
				if 'examplesrc' in m.keys():
					item += ' from ' + resolve(m['examplesrc'], '')
				item += ': <blockquote><pre>'
				for line in open(m['example'], 'r', encoding='utf-8').readlines():
					item += line
				item += '</pre></blockquote>'
				items.append(item)
			if 'more' in m.keys():
				if 'example' in m.keys():
					item = 'More e'
				else:
					item = 'E'
				item += 'xamples: ' + resolve(m['more'],'')
				# item += 'xamples: <a href="%s">%s</a>' % (m['more'], bare(m['examples']))
				items.append(item)
			if 'maintained' in m.keys():
				if m['maintained'].startswith('http://'):
					item = resolve(macro + ' contributors', m['maintained'])
				else:
					item = 'Maintained by ' + m['maintained']
				items.append(item)
			content = '<ul><li>' + '</li><li>'.join(items) + '</li></ul>'
			g.write('''			<div class="tabbertab">
				<h2>%s</h2>
				<h3>%s</h3>
				%s
			</div>
''' % (macro, logo, content))
			# for mline in f.readlines():
			# 	g.write(mline)
	elif lines[i].find('#LASTMOD#') > -1:
		g.write(lines[i].replace('#LASTMOD#', d))
	else:
		g.write(lines[i])
	i += 1
g.close()
