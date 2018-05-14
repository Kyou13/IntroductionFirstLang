(function () {
    'use strict';

    var vm = new Vue({
       el: '#app',
       data: {
           newItem:'',
           todos:[
               'task1',
               'task2',
               'task3'
           ],
       },
        methods: {
          addItem: function () {
             this.todos.push(this.newItem);
             this.newItem='';
          },
          delItem: function (index) {
             if(confirm('Are you sure?')) {
                 this.todos.splice(index, 1);
             }
          }
        }
    });

})();
