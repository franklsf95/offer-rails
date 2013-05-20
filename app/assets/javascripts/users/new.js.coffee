$mw = $ '#more-wrapper'
$pw = $ '#person-wrapper'
$uname = $ '#user_name'
$c   = $ '#check'
$pid = $ '#user_person_id'
$bs  = $ '#btn-submit'

$ ->
  $uname.change getPersonId
  $('form').keypress (e) ->
    getPersonId() if e.keyCode == 13

getPersonId = ->
  $c.html ''
  p = $uname.val()
  if p == ''
    $c.append '<li>请先输入姓名</li>'
    $mw.slideUp()
    $bs.attr 'disabled', 'disabled'
  $.getJSON '/people/available',
    person: p
  , (data) ->
    if data <= 0
      if data == 0
        $c.append '<span class="label label-important"><i class="icon-remove icon-white"></i></span> 不存在这个人名。请<a href="/offers/new">先添加一条 offer 记录</a>。'
      else
        $c.append '<span class="label label-important"><i class="icon-remove icon-white"></i></span> 这个人名已注册账户。'
      $mw.slideUp()
      $bs.attr 'disabled', 'disabled'
    else
      $c.append '<span class="label label-success"><i class="icon-ok icon-white"></i></span> 这个人名可用。'
      $pid.val data
      $bs.removeAttr 'disabled'
      $mw.slideDown()
  false
