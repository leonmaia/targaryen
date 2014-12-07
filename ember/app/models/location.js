import DS from 'ember-data';

export default DS.Model.extend({
  venue_id: DS.attr('string'),
  journey: DS.belongsTo('journey')
});