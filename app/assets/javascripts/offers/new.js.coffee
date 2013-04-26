$p = $ '#offer_person'
$s = $ '#offer_school'
$d = $ '#dup-check'

$ ->
  $s.select2()
  $s.change checkDup
  $p.change checkDup

checkDup = ->
  $d.html ''
  person = $p.val()
  if person == ''
    $d.append '<li>You must first enter a name.</li>'
    return
  schools = $s.val()
  if schools == null
    $d.append '<li>You must first select a school.</li>'
    return
  for v in schools
    dupResult person, v, (isDup) ->
      label = (if not isDup then '<span class="label label-success"><i class="icon-ok icon-white"></i></span>' else '<span class="label label-important"><i class="icon-remove icon-white"></i></span>')
      str = (if isDup then 'exists' else 'does not exist')
      school = $('#offer_school option[value="' + v + '"]').text()
      $d.append "<p>#{label} Record '#{person} => #{school}' #{str}</p>"

dupResult = (p, s, cb) ->
  $.getJSON '/offers/exist',
    person: p
    school: s
  , (data) ->
    cb (data is '1')
