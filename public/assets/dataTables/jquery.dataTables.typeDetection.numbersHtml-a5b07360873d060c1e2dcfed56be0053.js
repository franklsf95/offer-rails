jQuery.fn.dataTableExt.aTypes.unshift(function(e){e=typeof e.replace=="function"?e.replace(/<.*?>/g,""):e,e=$.trim(e);var t="0123456789-",n="0123456789.",r,i=!1;r=e.charAt(0);if(t.indexOf(r)==-1)return null;for(var s=1;s<e.length;s++){r=e.charAt(s);if(n.indexOf(r)==-1)return null;if(r=="."){if(i)return null;i=!0}}return"num-html"});