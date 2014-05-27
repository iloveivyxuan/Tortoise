define(['engine/abstractagents'], (AbstractAgents) ->

  # Type Parameter: T <: Link - The type of links within `_agents`
  class LinkSet extends AbstractAgents

    # (Array[T]) => LinkSet
    constructor: (@_agents, @_breedName ="LINKS") ->
      super(@_agents)

    # () => String
    getBreedName: ->
      @_breedName

    # () => String
    toString: ->
      "(agentset, #{@size()} #{@getBreedName().toLowerCase()})"

    # (Array[U <: Turtle], TurtleSet[V]) => TurtleSet[U]
    _generateFrom: (newAgentArr, agents) ->
      new LinkSet(newAgentArr, agents.getBreedName())

)