({
    doInit: function(cmp,event) {
        var action = cmp.get('c.getRecord');
        action.setParams({'relatedRecordId':cmp.get('v.recordId')});
        action.setCallback(this, function(res){
            var state = res.getState();
            var returnValue;
            if(state === 'SUCCESS') {
                returnValue = res.getReturnValue();
            } else if(state === 'ERROR') {
                console.log(res.getError());
            }
        });
        $A.enqueueAction(action);
    },
    doSuccess: function(cmp,event)
    {
        this.disableForm(cmp);
        cmp.set('v.serverResponse', 'Your case has been submitted');
        cmp.set('v.showServerResponse', true);
        var action = cmp.get('c.sendNotification');
        action.setCallback(this, function(res){
            var state = res.getState();
            console.log(state);
            if(state === 'SUCCESS'){
                
            } else if(state === 'ERROR') {
                console.log(res.getError());
              
            }
        });
        $A.enqueueAction(action);
    },
    doSubmit: function(cmp,event)
    {
        this.disableForm(cmp);
        var action = cmp.get('c.sendNotification');
        action.setParams({
            'case':cmp.get('v.case')
        });
        action.setCallback(this, function(res){
            var state = res.getState();
            console.log(state);
            if(state === 'SUCCESS'){
                cmp.set('v.serverResponse', 'Your case has been submitted');
                cmp.set('v.showServerResponse', true);
            } else if(state === 'ERROR') {
                console.log(res.getError());
                cmp.set('v.showServerResponse', true);
                cmp.set('v.serverResponse', res.getError());
            }
        });
    },

    disableForm: function(cmp)
    {
        cmp.find('submitButton').set('v.disabled',true);
        cmp.find('subjectField').set('v.disabled',true);
        cmp.find('descriptionField').set('v.disabled',true);
        
    }

})
