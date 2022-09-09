//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelBooking{
    //ホテルのオーナー
    address payable public owner;
    //部屋が空きか満室か
    enum Statuses {Vacunt, Occupied} 
    Statuses public currentstatuses;

    constructor(){
        owner = payable(msg.sender);    //メッセージ送信者の送金アドレス
        currentstatuses = Statuses.Vacunt;
        }
        //予約するための関数
        function booking() public payable {
            
            //満室かどうかをチェックする
            require(currentstatuses==Statuses.Vacunt, "Already Occupied"); 

            //お金が足りるかどうかのチェック
            require(msg.value >= 2, "Not enough ETH");

            //満室状態にする
            currentstatuses = Statuses.Occupied;

            //オーナーに送金する
            owner.transfer(msg.value);
        }
}