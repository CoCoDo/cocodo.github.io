<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html version="-//W3C//DTD XHTML 1.1//EN"
      xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.w3.org/1999/xhtml
                          http://www.w3.org/MarkUp/SCHEMA/xhtml11.xsd">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1.0"/>
		<title>CoCoDo: Compiler Coding Dojo</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
		<link href="tabber.css" rel="stylesheet" type="text/css" media="screen" />
		<script type="text/javascript" src="tabber.js" />
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-3743366-7']);
		  _gaq.push(['_setDomainName', 'github.io']);
		  _gaq.push(['_setAllowLinker', true]);
		  _gaq.push(['_trackPageview']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		</script>
	</head>
	<body>
		<div class="c">
			<h1>Raincode Labs Compiler Coding Dojo</h1>
			<div class="rl">
			<img src="logo/cocodo.png" alt="Compiler Coding Dojo" title="CoCoDo"/>
			</div>
			<h2 class="rl"><a href="https://cocodo.github.io/">CoCoDo</a> @ <a href="https://2021.programming-conference.org/">‹Programming›</a></h2>
			<h2>22 March 2021, online</h2>
		</div>
		<div class="tabber">
			<div class="tabbertab">
				<h2>2021</h2>
				<p>
					<strong>CoCoDo</strong> is a <em>coding dojo</em> where you can enjoy an entire day of
					compiler programming under gentle guidance of field experts.
				</p>
				Due to the <a href="https://2020.programming-conference.org/attending/COVID-19">cancellation</a>
				of the <a href="https://2020.programming-conference.org">‹Programming› 2020</a> conference,
				<strong>CoCoDo 2020</strong> did <strong class="red">NOT</strong> take place in March 2020.
				We try again in 2021.
				<h3>Tentative programme (times in <a href="https://time.is/UTC">UTC</a>)</h3>
				<ul class="cool">
					<li><strong>13:00–14:30</strong>: A Tutorial on the <a href="http://www.metaborg.org/en/latest/">Spoofax</a> Language Workbench (<a href="https://eelcovisser.org/">Eelco Visser</a>)</li>
					<li><strong>15:00–16:30</strong>: An Interactive Exploration of a <a href="http://pharo.org/">Simple Compiler</a> (<a href="http://marcusdenker.de/">Marcus Denker</a>)</li>
					<li><strong>17:00–18:30</strong>: From Abstract Syntax Trees to Machine Code with <a href="https://llvm.org/">LLVM</a> (<a href="https://kyouko-taiga.github.io/">Dimitri Racordon</a>)</li>
				</ul>
				<br/>
				Feel free to browse the website (especially the “Technologies” tab above).
				<br/>
				<br/>
				Compiler construction comprises, but is not limited to, lexical analysis,
				syntactic analysis, preprocessing, context handling, code generation, code
				optimisation, virtual machines, interpreters, smell detection, clone
				management, portability, migration, refactoring, domain-specific language
				design, linking and loading, assembling and disassembling, generics and
				reflection, numerous paradigms and so much more.
				<br/>
				<br/>
				Organised by <a href="https://www.johanfabry.be/">Johan Fabry</a> and <a href="http://grammarware.github.io">Vadim Zaytsev</a> as a part of <a href="https://www.raincodelabs.com/">Raincode Labs</a> academic activities.

				<h3>Post-Proceedings Program Committee</h3>
				<ul>
					<li><span class="red"><a href="http://andreichis.com/">Andrei Chiş</a></span> (<a href="https://feenk.com/">feenk</a>, Switzerland)</li>
					<li><span class="red"><a href="https://www.johanfabry.be/">Johan Fabry</a></span> (<a href="https://www.raincodelabs.com/">Raincode Labs</a>, Belgium) — co-chair</li>
					<li><span class="red"><a href="https://pure.royalholloway.ac.uk/portal/en/persons/adrian-johnstone(7cc2e828-2b0f-4cb7-a169-337193b854b8).html">Adrian Johnstone</a></span> (<a href="https://pure.royalholloway.ac.uk/portal/en/organisations/centre-for-software-language-engineering(83d7223d-082f-4eec-875e-9ff38d30f886).html">Royal Holloway</a>, UK)</li>
					<li><span class="red"><a href="https://www.stefan-marr.de/">Stefan Marr</a></span> (<a href="https://www.kent.ac.uk/computing/people/3167/marr-stefan">University of Kent</a>, UK)</li>
					<li><span class="red"><a href="https://fniephaus.com/">Fabio Niephaus</a></span> (<a href="https://www.hpi.uni-potsdam.de/hirschfeld/people/niephaus/index.html">Hasso Platner Institut</a>, Germany)</li>
					<li><span class="red"><a href="https://pure.royalholloway.ac.uk/portal/en/persons/elizabeth-scott_2b634c08-8249-413d-9654-031aed1f680b.html">Elizabeth Scott</a></span> (<a href="https://pure.royalholloway.ac.uk/portal/en/organisations/centre-for-software-language-engineering(83d7223d-082f-4eec-875e-9ff38d30f886).html">Royal Holloway</a>, UK)</li>
					<li><span class="red"><a href="https://inkytonik.github.io/">Anthony Sloane</a></span> (Australia)</li>
					<li><span class="red"><a href="https://homepages.cwi.nl/~storm/">Tijs van der Storm</a></span> (<a href="http://www.cwi.nl/">CWI</a> &amp; <a href="http://www.rug.nl/">University of Groningen</a>, The Netherlands)</li>
					<li><span class="red"><a href="http://grammarware.net">Vadim Zaytsev</a></span> (<a href="https://www.utwente.nl/en/eemcs/fmt/">University of Twente</a>, The Netherlands) — co-chair</li>
					<li>... to be continued ...</li>
				</ul>
				Submission link for post-proceedings/companion volume:
				<a href="https://easychair.org/conferences/?conf=cocodo2021"><code>https://easychair.org/conferences/?conf=cocodo2021</code></a>
			</div>
			<div class="tabbertab">
				<h2>2019</h2>
				<strong>CoCoDo 2019</strong> took place on 2 April 2019 in Genova, Italy as a part of the <a href="https://2019.programming-conference.org/track/cocodo-2019">‹Programming›</a> conference.
				<h3>Programme</h3>
				<ul class="cool">
					<li><strong>08:45–09:00</strong>: Opening and introductions (<a href="http://grammarware.github.io">Vadim Zaytsev</a>)</li>
					<li><strong>09:00–10:30</strong>: Scrap your <abbr title="Domain-Specific Language">DSL</abbr> Boilerplate with a Universe of Syntaxes, their Programs and Proofs (<a href="http://gallais.github.io/">Guillaume Allais</a> with <a href="https://wiki.portal.chalmers.se/agda/pmwiki.php">Agda</a>)</li>
					<li><strong>11:00–12:30</strong>: Language Engineering with Rascal (<a href="https://homepages.cwi.nl/~storm/">Tijs van der Storm</a> with <a href="https://www.rascal-mpl.org/">Rascal</a>)</li>
					<li>
						<strong>14:00–15:30</strong>: Tool Battle: 1 Infrastructure, 2 Parser Generators!
						<ul>
							<li><a href="https://github.com/ToshRaka">Jason Lecerf</a> with <a href="http://www.refactoryworkers.com/SmaCC.html">SmaCC</a></li>
							<li><a href="https://twitter.com/Chis_Andrei">Andrei Chiş</a> with <a href="http://scg.unibe.ch/research/helvetia/petitparser">PetitParser</a></li>
						</ul>
					</li>
					<li>
						<strong>16:00–17:00</strong>: Discussion, presentations and pitches
							<!-- <li><a class="blue" href="mailto:vadim@grammarware.net">Get in touch</a> if you are interested in participating!</li> -->
					</li>
				</ul>
				<h3>Links</h3>
				<ul>
					<li><a href="https://twitter.com/search?q=%23cocodo&amp;src=typed_query&amp;f=live">Browse #cocodo on Twitter</a></li>
				</ul>
				Organised by <a href="http://grammarware.github.io">Vadim Zaytsev</a> and <a href="https://twitter.com/johanfabry">Johan Fabry</a> as a part of <a href="https://www.raincodelabs.com/">Raincode Labs</a> academic activities.
			</div>
			<div class="tabbertab">
				<h2>2018</h2>
				<strong>CoCoDo 2018</strong> took place on 9 April 2018 in Nice, France as a part of the <a href="https://2018.programming-conference.org/track/cocodo-2018-dojo">‹Programming›</a> conference.
				<h3>Programme</h3>
				<ul class="cool">
					<li><strong>08:45–09:00</strong>: Opening and introductions (<a href="http://grammarware.github.io">Vadim Zaytsev</a>)</li>
					<li><strong>09:00–10:30</strong>: <a href="http://www.cs.swan.ac.uk/~cspdm/">Peter D. Mosses</a> with <a href="http://plancomps.csle.cs.rhul.ac.uk/">FunCons</a></li>
					<li><strong>11:00–12:30</strong>: <a href="http://cs.lth.se/jesper-oqvist/">Jesper Öqvist</a> with <a href="http://jastadd.org/web/">JastAdd</a></li>
					<li><strong>14:30–16:00</strong>: <a href="http://www.ii.uib.no/~anya/">Anya Helene Bagge</a> with <a href="https://www.rascal-mpl.org/">Rascal</a></li>
					<li>
						<strong>16:30–18:00</strong>: Presentations and pitches:
						<ul>
							<li><a href="https://twitter.com/johanfabry">Johan Fabry</a></li>
							<li><a href="https://www.fernuni-hagen.de/ps/team/friedrich.steimann.shtml">Friedrich Steimann</a></li>
						</ul>
					</li>
				</ul>
				<h3>Links</h3>
				<ul>
					<li><a href="https://twitter.com/search?f=tweets&amp;vertical=default&amp;q=cocodo&amp;src=spxr">Browse #cocodo on Twitter</a></li>
				</ul>
				Organised by <a href="http://grammarware.github.io">Vadim Zaytsev</a> as a part of <a href="https://www.raincodelabs.com/">Raincode Labs</a> academic activities.
			</div>
			<div class="tabbertab">
				<h2>2017</h2>
				<strong>CoCoDo 2017</strong> took place on 4 April 2017 in Brussels, Belgium as a part of the <a href="http://2017.programming-conference.org/track/cocodo-2017#program">‹Programming›</a> conference.
				<h3>Programme</h3>
				<ul class="cool">
					<li><strong>09:00–09:15</strong>: Opening and introductions (<a href="http://grammarware.github.io">Vadim Zaytsev</a>)</li>
					<li><strong>09:15–10:30</strong>: Attribute Grammars for DSLs for Music and 3D Graphics (<a href="https://pure.royalholloway.ac.uk/portal/en/persons/elizabeth-scott(2b634c08-8249-413d-9654-031aed1f680b).html">Elizabeth Scott</a>, <a href="https://pure.royalholloway.ac.uk/portal/en/persons/adrian-johnstone_7cc2e828-2b0f-4cb7-a169-337193b854b8.html">Adrian Johnstone</a>) with <a href="https://pure.royalholloway.ac.uk/portal/files/25269180/artTool.pdf">ART</a></li>
					<li><strong>11:00–12:00</strong>: Metaprogramming in Late Phases of Compilation (<a href="http://www.ii.uib.no/~anya/">Anya Helene Bagge</a>) with <a href="http://www.rascal-mpl.org/">Rascal</a></li>
					<li><strong>13:30–15:00</strong>: Experimenting with Racket as a Language Workbench (<a href="https://www.eecs.northwestern.edu/~robby/">Robby Findler</a>) with <a href="http://www.racket-lang.org/">Racket</a></li>
					<li><strong>15:30–17:00</strong>: The Future of Compilers (presentations and pitches)
					<ul>
						<li><a href="https://www.linkedin.com/in/arendsrik/">Rik Arends</a> with <a href="https://makepad.github.io/makepad.html">MakePad</a></li>
						<li><a href="http://softlang.wikidot.com/rlaemmel:home">Ralf Lämmel</a> with <a href="http://www.softlang.org/book">The Software Languages Book</a></li>
						<li><a href="https://pure.royalholloway.ac.uk/portal/en/persons/adrian-johnstone_7cc2e828-2b0f-4cb7-a169-337193b854b8.html">Adrian Johnstone</a> with <a href="http://plancomps.csle.cs.rhul.ac.uk/">FunCons</a></li>
						<li><a href="https://uclouvain.be/fr/repertoires/nicolas.laurent">Nicolas Laurent</a> with <a href="https://github.com/norswap/whimsy">Whimsy</a> and <a href="https://github.com/norswap/autumn">Autumn</a></li>
					</ul>
				</ul>
				<h3>Links</h3>
				<ul>
					<!-- https://goo.gl/forms/e8uj7zPN0xF0Y0Qx1 -->
					<li><u>Register and get a t-shirt!</u> (offer expired)</li>
					<li><a href="https://www.facebook.com/events/1769565396626015/">RVSP to a Facebook event</a></li>
					<li><a href="https://twitter.com/search?f=tweets&amp;vertical=default&amp;q=cocodo&amp;src=spxr">Browse #cocodo on Twitter</a></li>
				</ul>
				Organised by <a href="http://grammarware.github.io">Vadim Zaytsev</a> as a part of <a href="https://www.raincodelabs.com/">Raincode Labs</a> academic activities.
			</div>
			<div class="tabbertab">
				<h2>Technologies</h2>
		<div class="tabber">
			<tab>ANTLR</tab>
			<tab>Beaver</tab>
			<tab>Bison</tab>
			<tab>BiYacc</tab>
			<tab>BtYacc</tab>
			<tab>byacc</tab>
			<tab>BYACC/J</tab>
			<tab>Coco/R</tab>
			<tab>Copper</tab>
			<tab>DCG</tab>
			<tab>Eli</tab>
			<tab>Ensō</tab>
			<tab>Frown</tab>
			<tab>GDK</tab>
			<tab>GOLD</tab>
			<tab>Happy</tab>
			<tab>Iguana</tab>
			<tab>Irony</tab>
			<tab>JastAdd</tab>
			<tab>JavaCC</tab>
			<tab>jparsec</tab>
			<tab>Kiama</tab>
			<tab>Kleenex</tab>
			<tab>kwParsing</tab>
			<tab>Laja</tab>
			<tab>LGI</tab>
			<!-- Lark http://www.cocolab.com/cocktail.html not included because a license key must be preordered -->
			<tab>MetaEdit</tab>
			<tab>ML-Yacc</tab>
			<tab>Mouse</tab>
			<div class="tabbertab">
				<h2>MPS</h2>
				<h3><a href="https://www.jetbrains.com/mps/"><img src="logo/mps.png" alt="MPS"/></a></h3>
			</div>
			<tab>parboiled</tab>
			<tab>Parsec</tab>
			<tab>ParseLib</tab>
			<tab>parsnip</tab>
			<tab>PetitParser</tab>
			<tab>PLY</tab>
			<tab>PRECC</tab>
			<tab>PyBison</tab>
			<tab>PyLR</tab>
			<tab>pyparsing</tab>
			<tab>pysec</tab>
			<tab>Racket</tab>
			<tab>Ragel</tab>
			<tab>Rascal</tab>
			<tab>RecDescent</tab>
			<tab>SableCC</tab>
			<tab>Silver</tab>
			<tab>SimpleParse</tab>
			<tab>SJPT</tab>
			<tab>SmaCC</tab>
			<tab>SPARK</tab>
			<tab>Spirit</tab>
			<tab>Spoofax</tab>
			<tab>SugarJ</tab>
			<tab>SwiftParsec</tab>
			<tab>Takmela</tab>
			<tab>TXL</tab>
			<tab>vembyr</tab>
			<tab>Waxeye</tab>
			<tab>Whimsy</tab>
			<tab>Whole</tab>
			<!-- TODO: http://bford.info/packrat/ -->
			<tab>xtc</tab>
			<tab>Xtext</tab>
			<tab>yacc</tab>
			<tab>YAPPS</tab>
		</div>
		</div>
		</div>
		<br/><hr/>
		<div class="f">
			<a href="http://www.raincodelabs.com/"><img src="logo/labs.png" alt="Raincode Labs"/></a>
			The page is maintained by <a href="http://grammarware.github.io/">Dr. Vadim Zaytsev</a> a.k.a. @<a href="http://grammarware.net">grammarware</a>, ex-<a href="https://en.wikipedia.org/wiki/Chief_scientific_officer" title="Chief Science Officer">CSO</a> of <a href="http://www.raincodelabs.com/">Raincode Labs</a>, Professor of Software Evolution at the University of Twente.<br/>
			The picture used on this page is derivative from <a href="https://xkcd.com/303/">XKCD#303: Compiling</a> by Randall Munroe, <a href="http://creativecommons.org/licenses/by-nc/2.5/">CC-BY-NC</a>.<br/>
			The tabber code used on this page, is derivative from <a href="http://www.kean.edu/~gkolodiy/5223/tabber.html">the one made by Patrick Fitzgerald</a> and distributed under <a href="https://opensource.org/licenses/mit-license.php">the MIT license</a>.<br/>
			All other referenced works of art, science and engineering, are subject to their own individual copyrights.<br/>
			Last updated: #LASTMOD#.
		</div>
	</body>
</html>
