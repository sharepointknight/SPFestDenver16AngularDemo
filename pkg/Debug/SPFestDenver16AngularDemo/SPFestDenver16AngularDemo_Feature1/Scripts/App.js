'use strict';

angular.module('SPFestDenver16AngularDemo', ['AngularSP']).controller('DemoController', ['$scope', '$rootScope', '$filter', '$http', 'AngularSPREST',
    function ($scope, $rootScope, $filter, $http, $angularSP) {
        var vm = {};

        $scope.VM = vm;

        vm.Title = "";
        vm.Bands = [];
        vm.newBand = { Title: "", Category: "" };

        vm.Clicked = function Clicked() {
            alert(vm.Title);
        }
        vm.Save = function Save() {
            var item = {
                Title: vm.newBand.Title,
                Category1: vm.newBand.Category,
                ImageUrl: vm.newBand.ImageUrl,
                Description1: vm.newBand.Description1
            };
            $angularSP.CreateListItem("Bands", "/SPFestDenver16AngularDemo", item).then(function (data) {
                vm.Bands.push(data);
            });
        }

        vm.Init = function Init() {
            //var url = "/SPFestSeattleAngularDemo/_api/web/lists/getbytitle('Bands')/Items";

            var promise = $angularSP.GetListItems("Bands", "/SPFestDenver16AngularDemo");
            promise.then(function (data) {
                vm.Bands = data;
            });
        }
        vm.Init();

    }]);