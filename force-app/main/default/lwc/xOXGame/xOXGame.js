import { LightningElement, track } from 'lwc';
var map1 = new Map();
map1.set(1, "");
map1.set(2, "");
map1.set(3, "");
map1.set(4, "");
map1.set(5, "");
map1.set(6, "");
map1.set(7, "");
map1.set(8, "");
map1.set(9, "");
var min = 1;
var max = 9;
var returnvalue;
var randomnum;
export default class XOXGame extends LightningElement 
{
    @track time = "02:41";
    @track intro = "Welcome to XOX Game";
    @track input1;
    @track input2;
    @track input3;
    @track input4;
    @track input5;
    @track input6;
    @track input7;
    @track input8;
    @track input9;
    constructor()
    {
        super();
        
    }

    setMapValues(index,value)
    {
        
        map1.set(index, value);
        console.log("Map=",map1.get(1));
    }

    getMapValues(map1)
    {
        return this.map1;
    }

    connectedCallback()
    {
        this.getTime();
    }

    getTime()
    {
        const date = new Date();
        const hour = date.getHours();
        const minute = date.getMinutes();

        this.time = `${this.getHour(hour)}:${this.getDoubleDigit(minute)}`;

        this.setIntro(hour);
        this.getMapValues();
    }

    

    getHour(hour)
    {
        return hour;
    }

    getDoubleDigit(digit)
    {
        return digit<10 ? "0"+digit : digit;
    }

    setIntro(hour)
    {
        if(hour < 12)
            this.intro = "Good Morning, welcome to the XOX Game!";
        else if (hour >= 12 && hour < 17)
            this.intro = "Good Noon, Welcome to the XOX Game!";
            else
            this.intro = "Good Evening, Welcome to the XOX Game!";

            
    }

    setMoveComp()
    {
        this.checkforWinUser();
        var randomnum = this.getRandomIntInclusive(1,9);
        console.log("Random Value",randomnum);
        if(map1.get(randomnum) == "") 
        {
            this.setMapValues(randomnum,"O"); 
            console.log("updated map",map1);
            this.setCPUresponse(randomnum);
        }
        else
        {
            for (let index = 1; index <= 9; index++) 
            {
                if(map1.get(index) == "")
                {
                    this.setMapValues(index,"O"); 
                    this.setCPUresponse(index);
                    break;
                }
                else if (index == 9)
                {
                    this.intro = "DRAW..! restart and challenge Again!";
                }
                else
                    continue;
            }
        }
        this.checkforWinCPU();
            


        
        
        /*if(map1.get(1)=="X" && map1.get(2)=="" && map1.get(3)=="")
             returnvalue = 0;*/

        /*for (let index = 1; index <= 9; index++) 
        {
            const element = map1.get(index);
            console.log("setMoveComp=",element);
            
        }*/
    }
    
    buttonHandler(event)
    {
        
            


        var inp = this.template.querySelectorAll("lightning-input");
        //if(this.template.querySelector('lightning-input[data-name="input1"]').value == "X")
            //this.template.querySelector('lightning-input[data-name="input2"]').value = "O";    
        
        inp.forEach(function(element)
        {
            if(this.template.querySelector('lightning-input[data-name="input1"]').value == "X" && map1.get(1) == "")
                  {
                      this.setMapValues(1,"X"); 
                      console.log("inside the for loop",map1.get(1));
                  }  

            else if(this.template.querySelector('lightning-input[data-name="input2"]').value == "X" && map1.get(2) == "")
            {
                    this.setMapValues(2,"X"); 
                    console.log("inside the for loop",map1.get(2));
            }
            //this.template.querySelector('lightning-input[data-name="input3"]').value = "O"; 

            else if(this.template.querySelector('lightning-input[data-name="input3"]').value == "X" && map1.get(3) == "")
            //this.template.querySelector('lightning-input[data-name="input4"]').value = "O"; 
                //this.input3=element.value;
            {
                this.setMapValues(3,"X"); 
                console.log("inside the for loop",map1.get(3));
            }

            else if(this.template.querySelector('lightning-input[data-name="input4"]').value == "X" && map1.get(4) == "")
            //this.template.querySelector('lightning-input[data-name="input5"]').value = "O"; 

            {
                    this.setMapValues(4,"X"); 
                    console.log("inside the for loop",map1.get(4));
            }

            else if(this.template.querySelector('lightning-input[data-name="input5"]').value == "X" && map1.get(5) == "")
            //this.template.querySelector('lightning-input[data-name="input6"]').value = "O"; 
            {
                this.setMapValues(5,"X"); 
                console.log("inside the for loop",map1.get(5));
            }
            else if(this.template.querySelector('lightning-input[data-name="input6"]').value == "X" && map1.get(6) == "")
            //      this.template.querySelector('lightning-input[data-name="input7"]').value = "O"; 
            {
                this.setMapValues(6,"X"); 
                console.log("inside the for loop",map1.get(6));
            }
            else if(this.template.querySelector('lightning-input[data-name="input7"]').value == "X" && map1.get(7) == "")
            //this.template.querySelector('lightning-input[data-name="input8"]').value = "O"; 
            {
                this.setMapValues(7,"X"); 
                console.log("inside the for loop",map1.get(7));
            }
            else if(this.template.querySelector('lightning-input[data-name="input8"]').value == "X" && map1.get(8) == "")
            //this.template.querySelector('lightning-input[data-name="input9"]').value = "O"; 
            {
                this.setMapValues(8,"X"); 
                console.log("inside the for loop",map1.get(8) );
            }
            else if(this.template.querySelector('lightning-input[data-name="input9"]').value == "X" && map1.get(9) == "")
            //this.template.querySelector('lightning-input[data-name="input1"]').value = "O"; 
            {
                this.setMapValues(9,"X"); 
                console.log("inside the for loop",map1.get(9));
            }
        },this);

        console.log("Map=",map1);
        this.setMoveComp();
        
    }

    handleChange(event) {
        //this.input1 = "X";
        this.template.querySelector('lightning-input.inp').input2 = "O";
        console.log('Inside handler',this.input2);

    }

    getRandomIntInclusive(min, max) 
    {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
    }

    setCPUresponse(randomnum)
    {
        console.log("Switch Random",randomnum);
        switch(randomnum)
        {
              case 1:
                this.template.querySelector('lightning-input[data-name="input1"]').value = "O";
              break;
              case 2:
                this.template.querySelector('lightning-input[data-name="input2"]').value = "O";
              break;
              case 3:
                this.template.querySelector('lightning-input[data-name="input3"]').value = "O";
              break;
              case 4:
                this.template.querySelector('lightning-input[data-name="input4"]').value = "O";
              break;
              case 5:
                this.template.querySelector('lightning-input[data-name="input5"]').value = "O";
              break;
              case 6:
                this.template.querySelector('lightning-input[data-name="input6"]').value = "O";
              break;
              case 7:
                this.template.querySelector('lightning-input[data-name="input7"]').value = "O";
              break;
              case 8:
                this.template.querySelector('lightning-input[data-name="input8"]').value = "O";
              break;
              case 9:
                this.template.querySelector('lightning-input[data-name="input9"]').value = "O";
              break;
            default:
              console.log("Sorry, nothing");
          }

    }

    checkforWinUser()
    {
        if(map1.get(1) == "X" && map1.get(2) == "X" && map1.get(3)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(4) == "X" && map1.get(5) == "X" && map1.get(6)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(7) == "X" && map1.get(8) == "X" && map1.get(9)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(1) == "X" && map1.get(4) == "X" && map1.get(7)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(2) == "X" && map1.get(5) == "X" && map1.get(8)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(3) == "X" && map1.get(6) == "X" && map1.get(9)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(1) == "X" && map1.get(5) == "X" && map1.get(9)=="X")
            this.intro = "Congratulations!!, you have won";
        if(map1.get(3) == "X" && map1.get(5) == "X" && map1.get(7)=="X")
            this.intro = "Congratulations!!, you have won";
       
        
    }

    checkforWinCPU()
    {
        if(map1.get(1) == "O" && map1.get(2) == "O" && map1.get(3)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(4) == "O" && map1.get(5) == "O" && map1.get(6)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(7) == "O" && map1.get(8) == "O" && map1.get(9)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(1) == "O" && map1.get(4) == "O" && map1.get(7)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(2) == "O" && map1.get(5) == "O" && map1.get(8)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(3) == "O" && map1.get(6) == "O" && map1.get(9)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(1) == "O" && map1.get(5) == "O" && map1.get(9)=="O")
        this.intro = "Try Again!! you have lost!";
    if(map1.get(3) == "O" && map1.get(5) == "O" && map1.get(7)=="O")
        this.intro = "Try Again!! you have lost!";
    }


}