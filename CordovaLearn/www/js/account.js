angular.module('accountApp', ['ionic'])
.run(function ($ionicPlatform) {
	$ionicPlatform.ready(function(){
		if(window.cordova && window.cordova.plugins.Keyboard){
			cordova.plugins.Keyboard.hideKeyboradAccessoryBar(true);
		}
		if (window.StatusBar) {
			StatusBar.styleDefault();
		};
	})
})

.controller('accountCtrl', ['$scope', function ($scope) {
	$scope.list = [{time: "2015-11-22 09:00:00", detail: "+27000.00", notice: "保证金"}, 
					{time: "2015-11-21 19:00:00", detail: "+29000.00", notice: "充值"},
					{time: "2015-11-21 15:30:00", detail: "+27600.00", notice: "解冻"},
					{time: "2015-11-21 09:00:00", detail: "-27000.00", notice: "提现"}];


	$scope.hasmore = true;

	$scope.chooseDate = function(){
        //定义按钮点击事件
        var win = function(d) {
        //        console.log("Bookmark added!");
        alert(d);
        };
        var fail = function(e) {
        console.log(e)
        }
//        alert("11");
//        var bookmark = document.getElementById("bookmark").value
        cordova.exec(win, fail, "GetAccountPlugin", "addTime", "");
//        alert("222");
	};

	$scope.doRefresh = function(){
//		//开始请求数据
//		$http.get('http://www.runoob.com/try/demo_source/item.json')  //注意改为自己本站的地址，不然会有跨域问题
//            .success(function(newItems) {
//                $scope.items = newItems;
//            })
//            .finally(function() {
//                $scope.$broadcast('scroll.refreshComplete');
//            });
//            
            
         $scope.$broadcast('scroll.refreshComplete');//结束刷新
	};

	$scope.loadMore = function(){	
	   	// $scope.hasmore = false;
	    $scope.list.push({time: "2015-11-20 19:00:00", detail: "+29020.00", notice: "充值"});
	    $scope.$broadcast('scroll.infiniteScrollComplete');
	};

	$scope.$on('$stateChangeSuccess', function() {
	    $scope.loadMore();
	});
}])
