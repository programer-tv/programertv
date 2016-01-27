!function(t,e){var a;t.rails=a={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not(button[type])",disableSelector:"input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input:file",linkDisableSelector:"a[data-disable-with]",CSRFProtection:function(e){var a=t('meta[name="csrf-token"]').attr("content");a&&e.setRequestHeader("X-CSRF-Token",a)},fire:function(e,a,n){var i=t.Event(a);return e.trigger(i,n),i.result!==!1},confirm:function(t){return confirm(t)},ajax:function(e){return t.ajax(e)},handleRemote:function(n){var i,r,o,l,d=n.data("cross-domain")||null,u=n.data("type")||t.ajaxSettings&&t.ajaxSettings.dataType;if(a.fire(n,"ajax:before")){if(n.is("form")){i=n.attr("method"),r=n.attr("action"),o=n.serializeArray();var s=n.data("ujs:submit-button");s&&(o.push(s),n.data("ujs:submit-button",null))}else n.is(a.inputChangeSelector)?(i=n.data("method"),r=n.data("url"),o=n.serialize(),n.data("params")&&(o=o+"&"+n.data("params"))):(i=n.data("method"),r=n.attr("href"),o=n.data("params")||null);return l={type:i||"GET",data:o,dataType:u,crossDomain:d,beforeSend:function(t,i){return i.dataType===e&&t.setRequestHeader("accept","*/*;q=0.5, "+i.accepts.script),a.fire(n,"ajax:beforeSend",[t,i])},success:function(t,e,a){n.trigger("ajax:success",[t,e,a])},complete:function(t,e){n.trigger("ajax:complete",[t,e])},error:function(t,e,a){n.trigger("ajax:error",[t,e,a])}},r&&(l.url=r),a.ajax(l)}return!1},handleMethod:function(a){var n=a.attr("href"),i=a.data("method"),r=a.attr("target"),o=t("meta[name=csrf-token]").attr("content"),l=t("meta[name=csrf-param]").attr("content"),d=t('<form method="post" action="'+n+'"></form>'),u='<input name="_method" value="'+i+'" type="hidden" />';l!==e&&o!==e&&(u+='<input name="'+l+'" value="'+o+'" type="hidden" />'),r&&d.attr("target",r),d.hide().append(u).appendTo("body"),d.submit()},disableFormElements:function(e){e.find(a.disableSelector).each(function(){var e=t(this),a=e.is("button")?"html":"val";e.data("ujs:enable-with",e[a]()),e[a](e.data("disable-with")),e.prop("disabled",!0)})},enableFormElements:function(e){e.find(a.enableSelector).each(function(){var e=t(this),a=e.is("button")?"html":"val";e.data("ujs:enable-with")&&e[a](e.data("ujs:enable-with")),e.prop("disabled",!1)})},allowAction:function(t){var e,n=t.data("confirm"),i=!1;return n?(a.fire(t,"confirm")&&(i=a.confirm(n),e=a.fire(t,"confirm:complete",[i])),i&&e):!0},blankInputs:function(e,a,n){var i,r=t(),o=a||"input,textarea";return e.find(o).each(function(){i=t(this),(n?i.val():!i.val())&&(r=r.add(i))}),r.length?r:!1},nonBlankInputs:function(t,e){return a.blankInputs(t,e,!0)},stopEverything:function(e){return t(e.target).trigger("ujs:everythingStopped"),e.stopImmediatePropagation(),!1},callFormSubmitBindings:function(a,n){var i=a.data("events"),r=!0;return i!==e&&i.submit!==e&&t.each(i.submit,function(t,e){return"function"==typeof e.handler?r=e.handler(n):void 0}),r},disableElement:function(t){t.data("ujs:enable-with",t.html()),t.html(t.data("disable-with")),t.bind("click.railsDisable",function(t){return a.stopEverything(t)})},enableElement:function(t){t.data("ujs:enable-with")!==e&&(t.html(t.data("ujs:enable-with")),t.data("ujs:enable-with",!1)),t.unbind("click.railsDisable")}},t.ajaxPrefilter(function(t,e,n){t.crossDomain||a.CSRFProtection(n)}),t(document).delegate(a.linkDisableSelector,"ajax:complete",function(){a.enableElement(t(this))}),t(document).delegate(a.linkClickSelector,"click.rails",function(n){var i=t(this),r=i.data("method"),o=i.data("params");return a.allowAction(i)?(i.is(a.linkDisableSelector)&&a.disableElement(i),i.data("remote")!==e?!n.metaKey&&!n.ctrlKey||r&&"GET"!==r||o?(a.handleRemote(i)===!1&&a.enableElement(i),!1):!0:i.data("method")?(a.handleMethod(i),!1):void 0):a.stopEverything(n)}),t(document).delegate(a.inputChangeSelector,"change.rails",function(e){var n=t(this);return a.allowAction(n)?(a.handleRemote(n),!1):a.stopEverything(e)}),t(document).delegate(a.formSubmitSelector,"submit.rails",function(n){var i=t(this),r=i.data("remote")!==e,o=a.blankInputs(i,a.requiredInputSelector),l=a.nonBlankInputs(i,a.fileInputSelector);return a.allowAction(i)?o&&i.attr("novalidate")==e&&a.fire(i,"ajax:aborted:required",[o])?a.stopEverything(n):r?l?a.fire(i,"ajax:aborted:file",[l]):!t.support.submitBubbles&&t().jquery<"1.7"&&a.callFormSubmitBindings(i,n)===!1?a.stopEverything(n):(a.handleRemote(i),!1):void setTimeout(function(){a.disableFormElements(i)},13):a.stopEverything(n)}),t(document).delegate(a.formInputClickSelector,"click.rails",function(e){var n=t(this);if(!a.allowAction(n))return a.stopEverything(e);var i=n.attr("name"),r=i?{name:i,value:n.val()}:null;n.closest("form").data("ujs:submit-button",r)}),t(document).delegate(a.formSubmitSelector,"ajax:beforeSend.rails",function(e){this==e.target&&a.disableFormElements(t(this))}),t(document).delegate(a.formSubmitSelector,"ajax:complete.rails",function(e){this==e.target&&a.enableFormElements(t(this))})}(jQuery);