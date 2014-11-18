`import Ember from 'ember'`

get = Ember.get
set = Ember.set

EllaStarRatingComponent = Ember.Component.extend
  tagName: 'ella-star-rating'

  attributeBindings: ['disabled']

  value: 0
  maximum: 5
  disabled: false
  size: 14

  outerStyle: (->
    size = get @, 'size'
    maximum = get @, 'maximum'
    width = maximum * size

    ['height: ', size, 'px; width: ', width, 'px;'].join('')
  ).property 'maximum', 'value'

  innerStyle: (->
    size = get @, 'size'
    decimal = get(@, 'value') / get(@, 'maximum')
    percent = decimal * 100
    ['width: ', percent, '%; background-position: 0 -', size, 'px;'].join('')
  ).property 'maximum', 'value'

  click: (e) ->
    return if get @, 'disabled'
    target = e.target

    if target is get(@, 'element')
      width = @$().width()
      halfway = width / 2
      set(@, 'value', if e.offsetX < halfway then 0 else get(@, 'maximum'))
    else
      width = @$().children().width()
      value = Math.ceil(get(@, 'maximum') * e.offsetX / width)
      set(@, 'value', value)

`export default EllaStarRatingComponent`
