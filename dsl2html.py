#!/c/Users/vadim/AppData/Local/Programs/Python/Python35/python
# -*- coding: utf-8 -*-

import glob, datetime, json

d = ('Zeroary', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',\
	'September', 'October', 'November', 'December')[datetime.date.today().month]+\
	' '+str(datetime.date.today().year)
lang = {"en": "English", "de": "German", "nl": "Dutch", "fr": "French", "ru": "Russian"}
techs = {
	"ALL(*)": "http://www.antlr.org/papers/allstar-techreport.pdf",
	"BX": "http://www.prg.nii.ac.jp/project/bigul/",
	"GLR": "https://en.wikipedia.org/wiki/GLR_parser",
	"LALR": "https://en.wikipedia.org/wiki/LALR_parser",
	"LALR(1)": "https://en.wikipedia.org/wiki/LALR_parser",
}

def bare(s):
	return s.split('/')[2].replace('www.','')

def resolve(s,l):
	if not l:
		l = s
		s = bare(l)
	return '<a href="%s">%s</a>' % (l,s)

def tryResolveTech(s):
	if s in techs.keys():
		return resolve(s,techs[s])
	else:
		return s

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
			else:
				logo = macro
			items = [macro]
			items.append('Main website: <a href="%s">%s</a>' % (m['uri'], bare(m['uri'])))
			if 'version' in m.keys():
				items[0] += ' version %s' % m['version']
			if 'lang' in m.keys():
				item = 'Works with ' + ', '.join(m['lang'])
				items.append(item)
			if 'wikipedia' in m.keys():
				item = 'Wikipedia:'
				for k in m['wikipedia'].keys():
					for v in m['wikipedia'][k]:
						item += ' (<a href="https://%s.wikipedia.org/wiki/%s">%s</a>)' % (v,k,lang[v])
				items.append(item)
			if 'download' in m.keys():
				items[0] += ' (<a href="%s">download</a>)' % m['download']
			if 'parsing' in m.keys():
				if len(m['parsing']) == 1:
					item = 'Parsing algorithm: ' + tryResolveTech(m['parsing'][0])
				else:
					item = 'Parsing algorithms: ' + ', '.join([tryResolveTech(a) for a in m['parsing']])
				items.append(item)
			if 'example' in m.keys():
				item = 'Example'
				if 'examplesrc' in m.keys():
					item += ' from <a href="%s">%s</a>' % (m['examplesrc'], bare(m['examplesrc']))
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
