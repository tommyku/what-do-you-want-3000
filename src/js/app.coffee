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
    fnName = mgName.toLowerCase()
    if fnName != mgName
      return S(ff(window[fnName].next().value)).capitalize()
    else
      return ff(window[fnName].next().value)

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
  'bard'
  'singer'
  'dancer'
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
  'reported to his #relationship# that he #action#'
  'had a duel with #actor#, both were badly injured'
  'broke into #actor#\'s place'
  'betrayed his #relationship#'
  'starved to death'
  'sold a #quality# #article# at ridiculous price'
])

$actor = mg([
  '#attribute# #attribute# #class#'
  '#attribute# #class#'
  '#class#'
  '#class#'
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

$quality = mg([
  'real nice'
  'high quality'
  'broken but rare'
  'extremely rare'
  'one of a kind'
  'fresh'
])

$frame = mg([
  '#Time#, a #actor# #action#. I bet they won\'t do it again any time soon.'
  '#Time#, a #actor# told me that he #action#, now he is on escape.'
  'Hey, do you know what happened to the #actor# since we talked about him #time#?'
  'Hey, you know that #actor# we talked about #time# #action#?'
  'My #relationship# told me he got a #quality# #article# from a #actor#. I can hook you up if you\'re interested.'
  'Man I miss the old days, when my #relationship# #action# all the time.'
  'You selling #quality# #article#? My #relationship# sent me.'
  'You selling #quality# #article#? My #relationship# might wanna get one.'
  'You selling #quality# #article#? Don\'t let those #actor# get it before I do.'
  'Everybody knows #article# is hard to come by these days, especially #quality# ones. Now I have a connection, he\'s a #actor#, interested?'
])

$story = mg([
  '#frame#'
])

for k in [1..10]
  document.getElementById('content').innerHTML += "<p>#{ff($story.next().value)}</p>"
