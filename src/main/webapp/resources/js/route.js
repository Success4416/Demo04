/*登录*/
angular.module("loginApp",[]).controller("loginController",function($scope,$http){
	$scope.login=function(){
		$http({
			method:"post",
			url:"http://localhost:8080/hfy_dep/login.action",
			params:{uname:$scope.uname,pwd:$scope.pwd}
		}).then(function successCallback(response){
			alert(response.data);
			if(response.data){
				alert("登录成功!");
				location="list.html";
			}if(!response.data){
				alert("账号或密码错误!");
			}
		},function errorCallback(response){
			alert("请求失败....");
		})
	}
})

/*路由*/

var route = angular.module('listApp', ['ngRoute']);

   route .config(['$routeProvider', function($routeProvider){
        $routeProvider.when(
        	'/list',{
        		templateUrl:'show.html',
        		controller: 'listController'
        })
        .when(
        	'/',{
        		templateUrl:'shouye.jsp'
        })
        .when(
        	'/ticket_list',{
        		templateUrl:'ticket_list.jsp',
        		controller: 'listController'
        })
        .when(
    		'/gou',{
    			templateUrl:'shopping_car.jsp',
    			controller:'shoppingListController'
    		})
         .when(
        	'/staff',{
        		templateUrl:'staff.jsp',
        		controller: 'listController'
        })
       .when(
        	'/user',{
        		templateUrl:'user.jsp',
        		controller: 'listController'
        })
    }]);
   
    
  route.config(['$locationProvider', function($locationProvider) {
  	$locationProvider.hashPrefix('');
}]);

/*列表*/
route.controller("listController",function($scope,$http){
		//部门
		$http({
			method:"post",
			url:"rest/shop/getShopList",
		}).then(function successCallback(response){
			$scope.list=response.data;
		},function errorCallback(response){
			alert("请求失败list!");
		});
		
		$scope.add = function(id){
			var num = $("#"+id).val();
			$http({
				method:"post",
				url:"rest/shop/addOrderList",
				params:{id:id,num:num},
			}).then(function successCallback(response){
				alert("添加成功");
				location.reload();
			},function errorCallback(response){
				alert("添加失败!");
			});
		}
		/*
		$scope.delete = function(id){
		$http({
			method:"post",
			url:"http://localhost:8080/hfy_dep/delete.action",
			 params:{id:id},
		}).then(function successCallback(response){
			alert("删除成功");
			location.reload();
		},function errorCallback(response){
			alert("请求失败!");
		});
		}
		
		$scope.toupdate = function(id){
		$http({
			method:"post",
			url:"http://localhost:8080/hfy_dep/toupdate.action",
			 params:{id:id},
		}).then(function successCallback(response){
			$scope.depart=response.data;
		},function errorCallback(response){
			alert("请求失败!");
		});
		}
		
		$scope.update = function(){
		$http({
			method:"post",
			url:"http://localhost:8080/hfy_dep/update.action",
			 params:{id:$scope.depart.id,name:$scope.depart.name,address:$scope.depart.address,tel:$scope.depart.tel,describ:$scope.depart.describ,create_time:$scope.depart.create_time,modify_time:$scope.depart.modify_time},
		}).then(function successCallback(response){
			alert("修改成功");
			location.reload();
		},function errorCallback(response){
			alert("请求失败!");
		});
		}*/
})



/*购物车列表*/
route.controller("shoppingListController",function($scope,$http){
	//部门
	$http({
		method:"post",
		url:"rest/shop/getShoppingCarList",
	}).then(function successCallback(response){
		$scope.shoppingCarList=response.data;
	},function errorCallback(response){
		alert("请求失败carList!");
	});
	
	$scope.del = function(id){
		$http({
			method:"post",
			url:"rest/shop/delShoppingCarById",
			 params:{id:id},
		}).then(function successCallback(response){
			alert("删除成功");
			location.reload();
		},function errorCallback(response){
			alert("删除失败!");
		});
		};
});