/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(e){e.language="ar",e.filebrowserBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashUploadUrl="/ckeditor/attachment_files",e.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",e.filebrowserImageBrowseUrl="/ckeditor/pictures",e.filebrowserImageUploadUrl="/ckeditor/pictures",e.filebrowserUploadUrl="/ckeditor/attachment_files",e.allowedContent=!0,e.filebrowserParams=function(){for(var e,t,i,r=document.getElementsByTagName("meta"),o=new Object,a=0;a<r.length;a++)switch(i=r[a],i.name){case"csrf-token":e=i.content;break;case"csrf-param":t=i.content;break;default:continue}return void 0!==t&&void 0!==e&&(o[t]=e),o},e.addQueryString=function(e,t){var i=[];if(!t)return e;for(var r in t)i.push(r+"="+encodeURIComponent(t[r]));return e+(-1!=e.indexOf("?")?"&":"?")+i.join("&")},CKEDITOR.on("dialogDefinition",function(t){var i,r,o=t.data.name,a=t.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],o)>-1&&(i=a.getContents("Upload")||a.getContents("upload"),r=null==i?null:i.get("upload"),r&&r.filebrowser&&void 0===r.filebrowser.params&&(r.filebrowser.params=e.filebrowserParams(),r.action=e.addQueryString(r.action,r.filebrowser.params)))}),e.toolbar=[{name:"document",groups:["mode","document","doctools"],items:["Source"]},{name:"clipboard",groups:["clipboard","undo"],items:["Cut","Copy","Paste","PasteText","PasteFromWord","-","Undo","Redo"]},{name:"links",items:["Link","Unlink","Anchor"]},{name:"insert",items:["Image","Flash","Table","HorizontalRule","SpecialChar"]},{name:"paragraph",groups:["list","indent","blocks","align","bidi"],items:["NumberedList","BulletedList","-","Outdent","Indent","-","Blockquote","CreateDiv","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"]},"/",{name:"styles",items:["Styles","Format","Font","FontSize"]},{name:"colors",items:["TextColor","BGColor"]},{name:"basicstyles",groups:["basicstyles","cleanup"],items:["Bold","Italic","Underline","Strike","Subscript","Superscript","-","RemoveFormat"]}],e.toolbar_mini=[{name:"paragraph",groups:["list","indent","blocks","align","bidi"],items:["NumberedList","BulletedList","-","Outdent","Indent","-","Blockquote","CreateDiv","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"]},{name:"styles",items:["Font","FontSize"]},{name:"colors",items:["TextColor","BGColor"]},{name:"basicstyles",groups:["basicstyles","cleanup"],items:["Bold","Italic","Underline","Strike","Subscript","Superscript","-","RemoveFormat"]},{name:"insert",items:["Image","Table","HorizontalRule","SpecialChar"]}]};