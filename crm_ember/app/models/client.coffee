`import DS from 'ember-data'`

client = DS.Model.extend
  contacts: DS.hasMany('contact')
  name:     DS.attr('string')
  phone:    DS.attr('string')
  url:      DS.attr('string')
  status:   DS.attr('string')
  STATUSES: [  'not_contacted',
                'cold_called_not_interrested',
                'cold_called_req_callback',
                'cold_called_meeting_get',
                'gave_demo',
                'verbal_sign_up_agreement',
                'sign_up_form_given',
                'signed_contract',
                'pending_acct_setup_in_TS', 
                'went_live' ]


`export default client`