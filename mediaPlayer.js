(function() {
	var ext,
		audioSource,
		targetSrc,
		myPlayer = document.querySelector("#myAudioPlayer"),
		genreTitle = document.querySelector("#genreTitle"),
		arrayIndex = 0,
		arrayName = null,
		timeCounter = document.querySelector('#trackTime'),
		pBar = document.querySelector('#prog'),
		togglePlay = document.querySelector("#playButton"),
		muteTrack = document.querySelector("#muteButton"),
		shuffleBut = document.querySelector("#shuffle"),
		volSlider = document.querySelector("#volumeSlider"),
		volControlRemoved = false,
		genreButtons = document.querySelectorAll('#buttonHolder img'),
		dropTarget = document.querySelector('#theTarget'),
		nextTrack = null;

	// initial setup => some default values
	volSlider.value = 100;

	// get the current audio source
	setTimeout(function()
	{
			audioCurrentSource = myPlayer.currentSrc.toString();
	ext = audioCurrentSource.substr(audioCurrentSource.lastIndexOf("."));
}, 500);


	// methods
	function controlVol()
	{
		myPlayer.volume = (volSlider.value / 100);
	}

	function shuffleMode()
	{
		shuffleBut.classList.toggle("shuffleMode");
	}

	function playToggle()
	{
		togglePlay.classList.toggle('pauseMode');

		if (myPlayer.paused)
		{
			myPlayer.play();
		}
		else
		{
			myPlayer.pause();
		}
	}

	function trackMute() {
		if (volControlRemoved) {
			// tween volume back up
			console.log("tween vol up");
			this.classList.toggle("muteMode");
			TweenMax.to(myPlayer, 0.7, {volume:(volSlider.value / 100), onComplete:checkVol});
			volControlRemoved = false;
		} else {
			TweenMax.to(myPlayer, 0.7, {volume:0});
			myPlayer.removeEventListener("timeupdate", controlVol, false);
			this.classList.toggle("muteMode");
			volControlRemoved = true;
		}
	}

	function checkVol() {
		myPlayer.addEventListener("timeupdate", controlVol, false);
	}

	function toggleMuteClass() {
		muteTrack.classList.toggle("muteMode");
		myPlayer.removeEventListener("volumechange", toggleMuteClass, false);
	}


	function updateBar() {
		console.log("updateBar fired");
		var percent = Math.floor((100 / myPlayer.duration) * myPlayer.currentTime);

		// try to run what's in the brackets; if there's an error, catch / handle that without breaking the application
		try {
			pBar.value = percent;
		} catch(e) {
			console.log('caught a momentary non-critical error: ', e);
		}

	}

	// can listen for the "end" of an audio or video file, which fires an event -> can do something with that (in this case load the next track, and then figure out what the one after that will be)
	function logEnded() {
		// next track set on click
		if (nextTrack) {
			playTrack(nextTrack);

			getNextTrack(null); // go find the next track in the list, or start over at the beginning
		}
	}

	function drag(e)
	{
		var theData = e.dataTransfer.setData('storedId', e.target.id);
		targetSrc = e.target.src;

	}

	function allowDrop(e)
	{
		e.preventDefault();
	}

	// do an ajax call on the drop and build stuff in a .done function
	function drop(e)
	{
		e.preventDefault();

		var draggedData = e.dataTransfer.getData('storedId');

		e.target.src = targetSrc;

		$.ajax
		({
			url: 'includes/ajaxQuery.php',
			type: 'GET',
			data: { genre: draggedData }
		})

		.done(function(data)
		{
			console.log(data);

			if(data && data !=="null")
			{
				data = JSON.parse(data),

				buildTracks(data);
			}
			else
			{
				console.log('something is wrong with your query!');
			}
		})

		.fail(function(ajaxCall, error, status)
		{
			console.log('error');
			console.dir(ajaxCall);
		});
	}

	// ajax call should build this
	function buildTracks(tracklist) {
		genreTitle.innerHTML = tracklist[0].genre;

		var loadedTracks = document.querySelector(".trackHolder");

		loadedTracks.innerHTML = '';

		[].forEach.call(tracklist, function(track, index) {
			var newTrack = document.createElement('li'),
				trackLabel = document.createElement('p');

			trackLabel.classList.add('trackNameStyle');
			newTrack.dataset.track = track.movie_name;
			trackLabel.innerHTML = track.movie_description;

			// add the pieces to the containing list element
			newTrack.appendChild(trackLabel);
			loadedTracks.appendChild(newTrack);
		});

		// add event handling to new track elements
		$('.trackHolder li').on('click', function() {
			var newTrack = this.dataset.track;
			playTrack(newTrack);

			if (this.nextElementSibling) {
				nextTrack = this.nextElementSibling.dataset.track;
			} else nextTrack = tracklist[0].movie_name;
		});

		//mock a click
		$('.trackHolder li').first().trigger('click');
	}

	function getNextTrack(element) {
		if (!element) {
			element = document.querySelector('[data-track="' + nextTrack + '"]');

			if (element.nextElementSibling) {
				nextTrack = element.nextElementSibling.dataset.track;
			} else {
				nextTrack = $('.trackHolder li').first().data('track');
			}
		}
	}

	function playTrack(whichTrack)
	{
		//update a media source and then load and play it (don't forget )

		myPlayer.src = "videos/" + whichTrack + ext;

		myPlayer.load();
		myPlayer.play();
	}

	// parses the total time of the audio (or video) file, shows the elapsed / current playhead time
	function displayTime() {
		var minutes = Math.floor(myPlayer.currentTime / 60);
		var seconds = Math.round(myPlayer.currentTime % 60);

		var durMinutes = Math.floor(myPlayer.duration / 60);
		var durSeconds = Math.round(myPlayer.duration % 60);

		if (durSeconds < 10) {
			durSeconds = "0" + durSeconds;
		}

		if (seconds < 10) {
			seconds = "0" + seconds;
		} else if (seconds == 60) {
			seconds = "00";
		}

		// show the calculated time in the control bar
		timeCounter.innerHTML = minutes + ":" + seconds + " / " + durMinutes + ":" + durSeconds;
	}

	// event handling
	myPlayer.addEventListener("ended", logEnded, false);
	myPlayer.addEventListener("timeupdate", displayTime, false);
	myPlayer.addEventListener("timeupdate", updateBar, false);
	myPlayer.addEventListener("timeupdate", controlVol, false);

	theTarget.addEventListener('drop', drop, false);
	theTarget.addEventListener('dragover', allowDrop, false);

	togglePlay.addEventListener("click", playToggle, false);
	muteTrack.addEventListener("click", trackMute, false);
	shuffleBut.addEventListener("click", shuffleMode, false);

	volSlider.addEventListener("change", controlVol, false);

	[].forEach.call(genreButtons, function(button) {
		button.addEventListener('dragstart', drag, false);
	});
})();
