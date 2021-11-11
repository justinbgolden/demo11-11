
const API_ENDPOINTS = {
   
    listData: "../_api/web/lists/GetByTitle('SectionsPages')/items?$top=100",
    
}
var sort_by = function (field, reverse, primer) {

    var key = primer ?
        function (x) { return primer(x[field]) } :
        function (x) { return x[field] };

    reverse = !reverse ? 1 : -1;

    return function (a, b) {
        return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
    }
}
function findObjectByKey(array, key, value) {
    for (var i = 0; i < array.length; i++) {
        if (array[i][key] === value) {
            return array[i];
        }
    }
    return null;
}

new Vue({
    el: '#ajgDemo',
    mounted: function () {
        this.getCurrentUser();        
        this.getListRecords();
        
    },
    data: {
  
        currentUser: '',
        listData: [],
        showLoader: true
    },
    computed: {  
    },
    filters: {

    },
    methods: {
        getFormDigest: function () {
            //the form digest pulls the session token from SharePoint which allows for the current user to update content in the sharePoint lists. 
            var self = this;
          //  setInterval(function () {
            axios({
                method: 'post',
                data: '',
                url: '../_api/contextinfo',
                headers: { 'Accept': 'application/json;odata=verbose' },
            })
                .then(function (response) {

                    if (response.status == 200) {
                        this.REQUESTDIGEST = response.data.d.GetContextWebInformation

                    } else {
                        console.log("error getting sp digest info" + response);
                    }
                }.bind(this));
          //  }, 10000)
        },
        getCurrentUser: function () {
            var self = this;
            axios.get('/_api/Web/currentUser?$expand=UserId', {
                headers: {
                    "Accept": "application/json;odata=verbose"
                }
            })
                .then(function (response) {


                    if (response.data.d) {
                        self.currentUser = response.data.d


                    } else {
                        console.log(response);

                    }


                }.bind(this))
                .catch(function (error) {
                    console.log(error);


                });
        },
        getListRecords: function () {
            var self = this;
            axios.get(API_ENDPOINTS.listData, {
                headers: {
                    "Accept": "application/json;odata=verbose"
                }
            })
                .then(function (response) {
                    if (response.data) {
                        
                        self.listData = response.data.d.results.sort(sort_by('Id', false, ''))
                   
                    } else {
                        console.log(response);
                    }
                }.bind(this))
                .catch(function (error) {
                    console.log(error);
                })
        }
    }
});
