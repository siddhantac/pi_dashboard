class Dashing.Text extends Dashing.Widget


  onData: (data) ->
    if data.status
      # clear existing color classes
      $(@get('node')).attr 'class', (i,c) ->
        c.replace /\bgrey|teal darken-1|red darken-3|indigo darken-3|red darken-4/g, ''
      # add new class
      $(@get('node')).addClass "#{data.status}"
