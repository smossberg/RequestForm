# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('#existing-actor-form').hide()
	$('#existing-actor-button').on "click", ->
		$('#existing-actor-form').toggle ->
			$('#existing-actor-button').toggleClass('btn-primary')
			$('#existing-actor-button').toggleClass('btn-default')
	
	$('#new-actor-form').hide()
	$('#new-actor-button').on "click", ->
		$('#new-actor-form').toggle ->
			$('#new-actor-button').toggleClass('btn-primary')
			$('#new-actor-button').toggleClass('btn-default')
