#!/usr/bin/python3
# -*- coding: utf-8 -*-

import glob, datetime, json, os

def download_link(link):
	if link.startswith('http://github.com') or link.startswith('https://github.com'):
		linktext = "github"
	elif link.startswith('http://bitbucket.') or link.startswith('https://bitbucket.'):
		linktext = "bitbucket"
	elif link.find('sourceforge.net') > -1:
		linktext = "sourceforge"
	else:
		linktext = "download"
	return ' (<a href="%s">%s</a>)' % (link, linktext)

d = ('Zeroary', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',\
	'September', 'October', 'November', 'December')[datetime.date.today().month]+\
	' '+str(datetime.date.today().year)
langorder = ["en", "nl", "fr", "de", "ru"]
lang = {"en": "English", "de": "German", "nl": "Dutch", "fr": "French", "ru": "Russian", "es": "Spanish"}
techs = {
	"AG": "https://en.wikipedia.org/wiki/Attribute_grammar",
	"ALL(*)": "http://www.antlr.org/papers/allstar-techreport.pdf",
	"backtracking": "https://en.wikipedia.org/wiki/Backtracking",
	"bottom-up": "https://en.wikipedia.org/wiki/Bottom-up_parsing",
	"BX": "http://www.prg.nii.ac.jp/project/bigul/",
	"contexts": "http://www.slideshare.net/esug/parsing-contexts-for-petitparser",
	"context-aware": "http://www-users.cs.umn.edu/~evw/pubs/vanwyk07gpce/",
	"data dependency": "http://iguana-parser.github.io/documentation.html#data-dependent-grammars",
	"DCG": "https://pdfs.semanticscholar.org/fbc0/4a1951003ba164303b2898fb7f3c6b4e9083.pdf",
	"DFA": "https://en.wikipedia.org/wiki/Deterministic_finite_automaton",
	"drag and drop": "https://en.wikipedia.org/wiki/Drag_and_drop",
	"FSM": "https://en.wikipedia.org/wiki/Finite-state_machine",
	"FST": "https://en.wikipedia.org/wiki/Finite-state_transducer",
	"GLL": "http://dotat.at/tmp/gll.pdf",
	"GLR": "https://en.wikipedia.org/wiki/GLR_parser",
	"LALR": "https://en.wikipedia.org/wiki/LALR_parser",
	"LL": "https://en.wikipedia.org/wiki/LL_parser",
	"LR": "https://en.wikipedia.org/wiki/LR_parser",
	"memoisation": "https://en.wikipedia.org/wiki/Memoization",
	"monadic": "http://www.cs.nott.ac.uk/~pszgmh/monparsing.pdf",
	"one-pass": "https://en.wikipedia.org/wiki/One-pass_compiler",
	"Packrat": "http://bford.info/packrat/",
	"PEG": "https://en.wikipedia.org/wiki/Parsing_expression_grammar",
	"RAG": "https://pdfs.semanticscholar.org/89f1/857e15d270c5c1f8417381368e4781c871e4.pdf",
	"recursive descent": "https://en.wikipedia.org/wiki/Recursive_descent_parser",
	"scannerless": "https://en.wikipedia.org/wiki/Scannerless_parsing",
	# "SGLR": "https://ivi.fnwi.uva.nl/tcs/pub/reports/1997/P9707.ps.Z",
	"SGLR": "https://pdfs.semanticscholar.org/90f2/8a411455fb783da17ad4b4efdda4464606c4.pdf",
	"SLR": "https://en.wikipedia.org/wiki/Simple_LR_parser",
	"Smalltalk": "https://en.wikipedia.org/wiki/Smalltalk",
	"top-down": "https://en.wikipedia.org/wiki/Top-down_parsing",
}
slang = {
	"C": "http://101companies.org/wiki/Language:C",
	"C#": "http://101companies.org/wiki/Language:CSharp",
	"C++": "http://101companies.org/wiki/Language:CPlusPlus",
	"D": "https://en.wikipedia.org/wiki/D_(programming_language)",
	"Delphi": "https://en.wikipedia.org/wiki/Delphi_(programming_language)",
	"Erlang": "https://en.wikipedia.org/wiki/Erlang_(programming_language)",
	"F#": "https://en.wikipedia.org/wiki/F_Sharp_(programming_language)",
	"Go": "https://en.wikipedia.org/wiki/Go_(programming_language)",
	"Haskell": "http://101companies.org/wiki/Language:Haskell",
	"Intel Asm": "https://en.wikipedia.org/wiki/x86_assembly_language",
	"Java": "http://101companies.org/wiki/Language:Java",
	"JavaScript": "http://101companies.org/wiki/Language:JavaScript",
	"Kotlin": "https://kotlinlang.org/",
	"ML": "https://en.wikipedia.org/wiki/ML_(programming_language)",
	"Oberon": "https://en.wikipedia.org/wiki/Oberon_(programming_language)",
	"Obj-C": "https://en.wikipedia.org/wiki/Objective-C",
	"Pascal": "https://en.wikipedia.org/wiki/Pascal_(programming_language)",
	"Perl": "https://en.wikipedia.org/wiki/Perl",
	"Prolog": "http://101companies.org/wiki/Language:Prolog",
	"Python1.5": "https://docs.python.org/release/1.5/",
	"Python2": "https://docs.python.org/2/",
	"Python3": "https://docs.python.org/3/",
	"Racket": "https://en.wikipedia.org/wiki/Racket_features",
	"Ruby": "https://en.wikipedia.org/wiki/Ruby_(programming_language)",
	"Scala": "https://en.wikipedia.org/wiki/Scala_(programming_language)",
	"Scheme": "https://en.wikipedia.org/wiki/Scheme_(programming_language)",
	"SDF3": "https://en.wikipedia.org/wiki/Syntax_Definition_Formalism",
	"Silver": "http://melt.cs.umn.edu/silver/",
	"Smalltalk": "https://en.wikipedia.org/wiki/Smalltalk",
	"Swift": "https://en.wikipedia.org/wiki/Swift_(programming_language)",
	"VB": "https://en.wikipedia.org/wiki/Visual_Basic",
	"VB.NET": "https://en.wikipedia.org/wiki/Visual_Basic_.NET",
	"XML": "https://en.wikipedia.org/wiki/XML",
}

def bare(s):
	if s.startswith('https://github.com/') or s.startswith('http://github.com/') or s.startswith('https://bitbucket.org/') or s.startswith('http://bitbucket.org/'):
		return '@%s/%s' % (s.split('/')[3], s.split('/')[4])
	elif s.strip().split('://')[1][2:].startswith('.wikipedia.org/'):
		return lang[s.strip().split('://')[1][:2]]
	elif s.find('web.archive.org') > -1:
		return bare(s.strip().split('://web.archive.org')[1][20:])
	else:
		return s.split('/')[2].replace('www.','')

def resolve(s,l):
	if not l:
		l = s
		s = bare(l)
	return '<a href="%s">%s</a>' % (l,s)

def tryresolve(s, d):
	if s in d.keys():
		return resolve(s, d[s])
	elif s.split('(')[0] in d.keys():
		return resolve(s, d[s.split('(')[0]])
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

def htmlify(s,kws,nkws):
	s = s.replace('&','&amp;')
	for k,v in {"<": "&lt;", ">": "&gt;"}.items():
		s = s.replace(k,v)
	for k in kws:
		if k == '/':
			s = s.replace('/span', 'THISWILLNEVEROCCURNATURALLY')
			s = s.replace('/', '<span class="kw">/</span>')
			s = s.replace('THISWILLNEVEROCCURNATURALLY', '/span')
		else:
			s = s.replace(k, '<span class="kw">%s</span>' % k)
	for nk in nkws:
		s = s.replace(htmlify(nk,kws,[]), nk)
	return s

def tofname(m):
	return m.lower().replace('ō','o').replace('/','')

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
		with open('tech/'+tofname(macro)+'.json', 'r', encoding='utf-8') as f:
			m = json.load(f)
			if 'logo' in m.keys() and 'fullname' in m.keys():
				logo = resolve('<img src="logo/%s" alt="%s" width="150px"/></a>' % (m['logo'], m['fullname']), m['uri']) + ' ' + m['fullname']
			elif 'logo' in m.keys():
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
				if type(m['download']) == type(''):
					items[0] += download_link(m['download'])
				elif type(m['download']) == type([]) and len(m['download']) == 1:
					items[0] += download_link(m['download'][0])
				else:
					for link in m['download']:
						items[0] += download_link(link)
			if 'parsing' in m.keys():
				if len(m['parsing']) == 1:
					item = 'Parsing algorithm: ' + tryresolve(m['parsing'][0],techs)
				else:
					item = 'Parsing algorithms: ' + ', '.join([tryresolve(a,techs) for a in m['parsing']])
				items.append(item)
			if 'example' in m.keys():
				item = 'Example from ' + resolve(m['example'], '')
				item += ': <blockquote><pre>'
				keywords = m['keywords'] if 'keywords' in m.keys() else []
				notkwrds = m['notkeywords'] if 'notkeywords' in m.keys() else []
				if os.path.exists('code/'+tofname(macro)+'.g'):
					for line in open('code/'+tofname(macro)+'.g', 'r', encoding='utf-8').readlines():
						item += htmlify(line, keywords, notkwrds)
				elif os.path.exists('code/'+tofname(macro)+'.png'):
					item += '<img src="code/'+tofname(macro)+'.png" alt="Screenshot" class="ss"/>'
				elif os.path.exists('code/'+tofname(macro)+'.jpg'):
					item += '<img src="code/'+tofname(macro)+'.jpg" alt="Screenshot" class="ss"/>'
				else:
					print('\tNeither grammar text nor screenshot found!')
				item += '</pre></blockquote>'
				items.append(item)
			if 'more' in m.keys():
				if 'example' in m.keys():
					item = 'More e'
				else:
					item = 'E'
				item += 'xamples: '
				if type(m['more']) == type(''):
					item += resolve(m['more'],'')
				else:
					item += ', '.join([resolve(k,'') for k in m['more']])
				items.append(item)
			if 'maintained' in m.keys():
				if len(m['maintained']) == 2:
					item = m['maintained'][0] + ' ' + resolve('and others', m['maintained'][1])
				elif m['maintained'].startswith('http://') or m['maintained'].startswith('https://'):
					item = resolve(macro + ' contributors', m['maintained'])
				else:
					item = 'Maintained by ' + m['maintained']
				items.append(item)
			if 'ontop' in m.keys():
				item = 'Built on top of ' + tool + ': <ul>'
				for t in sorted(m['ontop'].keys()):
					item += '<li>' + resolve(t, m['ontop'][t]) + '</li>'
				item += '</ul>'
				items.append(item)
			if 'oftenwith' in m.keys():
				item = 'Used with: <ul>'
				for t in sorted(m['oftenwith'].keys()):
					item += '<li>' + resolve(t, m['oftenwith'][t][0])
					for l in m['oftenwith'][t][1:]:
						l = resolve(l, '')
						if l.split('>')[1][0].isupper():
							item += ' ('+l+')'
						else:
							item += ' '+l
						# item += ' '+resolve(l,'')
					item += '</li>'
				item += '</ul>'
				items.append(item)
			if 'confusedwith' in m.keys():
				for k in m['confusedwith']:
					item = 'Not to be confused with '
					item += '<a href="%s">%s</a>!' % (m['confusedwith'][k], k)
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
