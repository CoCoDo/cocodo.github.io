#!/c/Users/vadim/AppData/Local/Programs/Python/Python35/python
# -*- coding: utf-8 -*-

import glob, datetime, json

def bare(s):
	return s.split('/')[2].replace('www.','')

d = ('Zeroary', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',\
	'September', 'October', 'November', 'December')[datetime.date.today().month]+\
	' '+str(datetime.date.today().year)
lang = {"en": "English", "de": "German", "nl": "Dutch", "fr": "French", "ru": "Russian"}

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
			print(m)
			if 'logo' in m.keys():
				logo = '<a href="%s"><img src="logo/%s" alt="%s" width="150px"/></a>' % (m['uri'], m['logo'], macro)
			else:
				logo = macro
			items = [macro]
			items.append('Main website: <a href="%s">%s</a>' % (m['uri'], bare(m['uri'])))
			if 'version' in m.keys():
				items[0] += ' version %s' % m['version']
			if 'wikipedia' in m.keys():
				item = 'Wikipedia:'
				for k in m['wikipedia'].keys():
					for v in m['wikipedia'][k]:
						item += ' (<a href="https://%s.wikipedia.org/wiki/%s">%s</a>)' % (v,k,lang[v])
				items.append(item)
			if 'download' in m.keys():
				items[0] += ' (<a href="%s">download</a>)' % m['download']
			if 'parsing' in m.keys():
				k = list(m['parsing'].keys())[0]
				item = 'Parsing algorithm: <a href="%s">%s</a>' % (m['parsing'][k], k)
				items.append(item)
			if 'example' in m.keys():
				item = 'Example'
				if 'examplesrc' in m.keys():
					item += ' from <a href="%s">%s</a>' % (m['examplesrc'], bare(m['examplesrc']))
				item += ': <blockquote><pre>'
				for line in m['example']:
					item += line + '\n'
				item += '</pre></blockquote>'
				items.append(item)
			if 'examples' in m.keys():
				if 'example' in m.keys():
					item = 'More e'
				else:
					item = 'E'
				item += 'xamples: <a href="%s">%s</a>' % (m['examples'], bare(m['examples']))
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
