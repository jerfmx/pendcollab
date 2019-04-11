<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
		<uploader:head />
		<ckeditor:resources />
		<calendar:resources lang="es" theme="tiger"/>
		<resource:tooltip />
		<resource:reflectionImage/>
		<resource:portlet />
		<resource:lightBox />
		<dojo:header theme="soria"/>
		<dojo:require modules="['dijit.layout.TabContainer','dijit.layout.ContentPane', 'dijit.Editor']"/>
 		<pendcolab:resources />
 		<sm:pagePlayer/>
		<r:require module="jquery-ui"/>
		<r:layoutResources />
   </head>
    <body class="soria">
		<ckeditor:config height="400px" width="50%" />
		<ckeditor:config var="toolbar_Mytoolbar">
		[
			[ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ],
			[ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ],
			[ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ],
			[ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ],
			[ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ],
			[ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-',
			'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ],
			[ 'Link','Unlink','Anchor' ],
			[ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ],
			[ 'Styles','Format','Font','FontSize' ],
			[ 'TextColor','BGColor' ],
			[ 'Maximize', 'ShowBlocks','-','About' ]
		]
		</ckeditor:config>
		<ckeditor:config toolbar="Mytoolbar" />
		<div id="page">
			<div id="spinner" class="spinner" style="display:none;">
				<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
			</div>
			<div id="topbar">
				<g:render template="/common/topbar" />
			</div>
			<div id="header">
				<h1>Pendientes Colaborativos</h1>
				<richui:reflectionImage src="${resource(dir:'images',file:'grails_logo.png')}" />
			</div>
			<richui:portlet views="[1,2,3]" action="" readOnly="false">
				<table style="width: 960px; border: none" border="0" width="960">
					<tr>
						<td>
							<richui:portletView id="1" class="lsidebar" slotStyle="width: 200px; height: 400px" playerStyle="width: 200px; height: 400px">
								<div id="lsidebar">
									<g:render template="/common/ops"/>
								</div>
							</richui:portletView>
						</td>
						<td>
							<richui:portletView id="2" class="content" slotStyle="width: 560px; height: 400px" playerStyle="width: 560px; height: 400px">
								<div id="content">
									<br/>
									<g:layoutBody />
								</div>
							</richui:portletView>
						</td>
						<td>
							<richui:portletView id="3" class="sidebar" slotStyle="width: 200px; height: 400px" playerStyle="width: 200px; height: 400px">
								<div id="sidebar">
									<g:render template="/common/buddies" />
									<g:render template="/common/tags" />
								</div>
							</richui:portletView>
						</td>
					</tr>
				</table>
			</richui:portlet>
			<div id="footer">
				<g:render template="/common/footer" />
			</div>
		</div>
		<g:javascript library="dojo" />
        <g:javascript library="application" />
		<g:javascript library="scriptaculous" />
		<r:layoutResources />
    </body>
</html>
