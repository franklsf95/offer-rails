/* ============================================================
 * bootstrap-rowlink.js j1
 * http://jasny.github.com/bootstrap/javascript.html#rowlink
 * ============================================================
 * Copyright 2012 Jasny BV, Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */
!function(e){"use strict";var t=function(t,n){n=e.extend({},e.fn.rowlink.defaults,n);var r=t.nodeName.toLowerCase()=="tr"?e(t):e(t).find("tr:has(td)");r.each(function(){var t=e(this).find(n.target).first();if(!t.length)return;var r=t.attr("href");e(this).find("td").not(".nolink").click(function(){window.location=r}),e(this).addClass("rowlink"),t.replaceWith(t.html())})};e.fn.rowlink=function(n){return this.each(function(){var r=e(this),i=r.data("rowlink");i||r.data("rowlink",i=new t(this,n))})},e.fn.rowlink.defaults={target:"a"},e.fn.rowlink.Constructor=t,e(function(){e('[data-provide="rowlink"],[data-provides="rowlink"]').each(function(){e(this).rowlink(e(this).data())})})}(window.jQuery);