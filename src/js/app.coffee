'use strict'

mg = ($)->
  # make a generator
  return (()->
    e = $
    loop
      yield e[Math.floor(Math.random()*e.length)]
    return
  ).call()

ff = (frame)->
  # fill a frame
  split_regex = /\#([^\#]*)\#/g
  match_regex = /^\#(.+)\#$/
  split = []
  frame.replace split_regex, (trunk, inner, offset, string)->
    return trunk unless trunk.match(match_regex)
    mgName = "$#{trunk.match(match_regex)[1]}"
    return ff(window[mgName].next().value)

$name = mg([
  'Logus'
  'Lauks'
  'Leariton'
  'Losty'
  'Pantogran'
  'Arcodia'
  'Sertoky'
  'Kinger'
  'Gravoty'
  'Kiopa'
])

$time = mg([
  'yesterday'
  'last week'
  'just now'
  'a couple hours ago'
  'recently'
  'not long ago'
  'last night'
  'yesterday morning'
])

$class = mg([
  'travelling merchant'
  'soldier'
  'merchant'
  'teacher'
  'student'
  'scavenger'
  'doctor'
  'officer'
  'thief'
  'detective'
  'bartender'
  'barber'
  'scholar'
  'engineer'
])

$attribute = mg([
  'drunk'
  'ambitious'
  'old'
  'married'
  'teenage'
  'sexy'
  'handsome'
  'young'
  'grown up'
  'disabled'
  'sick'
  'strong'
  'muscular'
])

$relationship = mg([
  'friend'
  'brother'
  'lover'
  'teacher'
  'colleague'
  'boss'
  'best friend'
  'sister'
  'mother'
  'father'
  'mentor'
  'business partner'
  'close friend'
  'former partner'
  'son'
  'kid'
  'daughter'
])

$action = mg([
  'had a fight with a #actor#'
  'tricked a #actor# and got caught'
  'went out with his #relationship#, and got shot by #actor# in the wild'
  'slept with his #relationship#\'s #relationship#'
])

$actor = mg([
  '#attribute# #attribute# #class#'
  '#attribute# #class#'
  '#class#'
])

$article = mg([
  'gem'
  'machine'
  'shotgun'
  'zombie hand'
  'bag of coffee beans'
  'purified water'
  'polluted river water'
  'mug'
  'apple tree'
  'jug of black water'
])

$frame = mg([
  '#time#, a #actor# #action#. I bet they won\'t do it again any time soon.'
  '#time#, a #actor# told me that he #action#, now he is on escape.'
  'Hey, do you know what happened to the #actor# since we talked about him #time#?'
  'My #relationship# told me he got a real nice #article# from a #actor#. I can hook you up if you\'re interested.'
])

$story = mg([
  '#frame#'
])

document.getElementById('content').innerHTML = ff($story.next().value)
