90001 cutRsc ["DIA_ENDSCREEN", "PLAIN"];
_bg = 3000;
_endTitle = 3001;
_left = 3002;
_right = 3003;
_bottomLeft = 3004;
_bottomMiddle = 3005;
_bottomRight = 3006;

params ["_scenario", "_teams"];

{

	_x enableSimulation false;

} forEach vehicles;

[] spawn {

	sleep 1;
	{

		_x enableSimulation false;
		removeAllWeapons _x;

	} forEach allPlayers;
};

_leftText = "";
_rightText = "";
_bottomTextLeft = "";
_bottomTextMiddle = "";
_bottomTextRight = "";
_textSide = 0;
{

	_x params ["_name", "_side", "_type", "_start", "_current", "_disabled", "_destroyed"];

	_temp = format ["%1<br />Casualties: %2 out of %3<br />", _name, (_start - _current), _start];

	if (count _disabled != 0) then {

		_temp = _temp + "<br />Disabled assets:<br />";

		{

			_temp = _temp + format ["%1<br />", _x];

		} forEach _disabled;

	};

	if (count _destroyed != 0) then {

		_temp = _temp + "<br />Destroyed assets:<br />";

		{

			_temp = _temp + format ["%1<br />", _x];

		} forEach _destroyed;
	};

	_temp = _temp + "<br />";

	if (_textSide == 0) then {

		_textSide = 1;
		_leftText = _leftText + _temp;

	} else {

		_textSide = 0;
		_rightText = _rightText + _temp;

	};

} forEach _teams;

_endTitleText = _scenario;

if (!isNil "aCount_textBLU" && !isNil "aCount_textRED" && !isNil "aCount_textRES") then {
	_bottomTextLeft = format["%1",aCount_textBLU];
	_bottomTextMiddle = format["%1",aCount_textRED];
	_bottomTextRight = format["%1",aCount_textRES];
};

disableSerialization;
_dia = uiNamespace getVariable "FW_EndScreen";

(_dia displayCtrl _endTitle) ctrlSetStructuredText parseText _endTitleText;
(_dia displayCtrl _left) ctrlSetStructuredText parseText _leftText;
(_dia displayCtrl _right) ctrlSetStructuredText parseText _rightText;
(_dia displayCtrl _bottomLeft) ctrlSetStructuredText parseText _bottomTextLeft;
(_dia displayCtrl _bottomMiddle) ctrlSetStructuredText parseText _bottomTextMiddle;
(_dia displayCtrl _bottomRight) ctrlSetStructuredText parseText _bottomTextRight;

for "_x" from 1 to 120 do {

	(_dia displayCtrl _bg) ctrlSetBackgroundColor [0, 0, 0, (_x * (1/120))];
	sleep(0.01);

};

sleep (15);
endMission "END1";
