`import DS from "ember-data"`
`import Ember from "ember"`
`import config from '../config/environment'`
get = Ember.get
serializer = DS.ActiveModelSerializer.extend

  serializeHasMany: (record, json, relationship) ->
    rel_ids = get(record, relationship.key).map (rel) -> get(rel, 'id') || []
    json["#{relationship.key.underscore().singularize()}_ids"] = rel_ids
    json
      

    # @_super(record, json, relationship)

`export default serializer`