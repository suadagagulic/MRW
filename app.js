$(document).foundation();

(function()
{
	"use strict";

	//---SMOOTH SCROLL SECTION---

	//Variables

	var topMenu = document.querySelector("#top-menu");
	var navLinks = topMenu.querySelectorAll("a");

	for (var i = 0; i < navLinks.length; i++)
		{
			navLinks[i].addEventListener("click", scrollto, false);
		}

	//Function

	function scrollto(e)
	{
		//console.log("click");
		var idNum = e.currentTarget.id;
		console.log(idNum);
		TweenLite.to(window, 1,{scrollTo:{y:"#lifeSec"+idNum, offsetY:70}});
	}

	(function()
{
	var list = document.querySelector('#list'),
	saveAll = document.querySelector('#saveAll'),
	clearAll = document.querySelector('#clearAll');

	function emptyStorage(e)
	{
		localStorage.clear();
	}

	function fillStorage()
	{
		localStorage.setItem('todoList', list.innerHTML);
	}

	function loadToDo()
	{
		if(window.localStorage)
		{
			if(localStorage.getItem('todoList'))
			{
				list.innerHTML = localStorage.getItem('todoList');
			}
		}
		else
		{
			console.log('Please update browser');
		}
	}

	clearAll.addEventListener('click', emptyStorage, false);
	saveAll.addEventListener('click', fillStorage, false);

	loadToDo();

})();

(function()
{
	var list = document.querySelector('#list'),
	saveAll = document.querySelector('#saveAll'),
	clearAll = document.querySelector('#clearAll');

	function emptyStorage(e)
	{
		localStorage.clear();
	}

	function fillStorage()
	{
		localStorage.setItem('todoList', list.innerHTML);
	}

	function loadToDo()
	{
		if(window.localStorage)
		{
			if(localStorage.getItem('todoList'))
			{
				list.innerHTML = localStorage.getItem('todoList');
			}
		}
		else
		{
			console.log('Please update browser');
		}
	}

	clearAll.addEventListener('click', emptyStorage, false);
	saveAll.addEventListener('click', fillStorage, false);

	loadToDo();

})();


})();
