#= require active_admin/base

$(document).ready ->
  $('[name=\'project[project_working_estimate_ids][]\'').map (index, el) ->
    $(el).click (event)->
      #$( "#working-estimates" ).append("")

#
#       #TODO: Add a special div for each selected element(el). You can store dictionary element -> div globally.
#       # if this checkbox is starting to be checked (.is('checked') == true ) - so you need to add div, otherwise you should delete corresponding div.
#       $( "#working-estimates" ).load( "/template/estimate?id=" + $(event.target).val(), ->
#         alert( "Load was performed." )
#       )
