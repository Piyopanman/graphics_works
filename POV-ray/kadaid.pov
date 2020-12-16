#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "skies.inc"
#include "consts.inc"

camera {
  location <0,10,-90>
  look_at <0,0,0>
  angle 20
}

 #declare T = 0;
 #declare r = 13;
#declare THETA = 2 * 3.14 * clock/18;
#declare PHI = abs(20*sin(9 * THETA));

//kotei light 1
light_source {
 <3, 20, -30>
 color Med_Purple
 spotlight
 point_at <20, 0, -10>
 radius 20
 falloff 45
  }
  
//kotei light 2
light_source {
 <-3, 20, -30>
 color Red*2
 spotlight
 point_at <0, 0, -10>
 radius 20
 falloff 45
  }  

light_source {
 < clock*20, 5, 4 >
 color YellowGreen * 2
 spotlight
 point_at <clock*10, 0, -36*clock+10>
 radius 5
 falloff 20
}

light_source {
  < 0, 5, 3 >
 color Cyan * 2
 spotlight
 point_at <-clock*2-5, 0, -26*clock+10>
 radius 5
 falloff 10
 rotate<0, 360 * clock , 0>
}

light_source {
  < clock*20+5, 5+clock*2, 4 >
 color SpringGreen * 2
 spotlight
 point_at <-clock*6+5, -4, -36*clock+10>
 radius 5
 falloff 10
 rotate<0, 720 * clock , 0>
}

light_source {
  < clock*10+5, 5+clock*2, -10 >
 color MediumSeaGreen * 2
 spotlight
 point_at <-clock*6+5, 0, -20*clock+10>
 radius 5
 falloff 10
 rotate<0, 720 * clock , 0>
}



//object { XYZaxis }

object{ 
	Plane_XZ texture{ DMFWood4 }
	translate <0, -4, 0>
 }
 
 

 
#while(T < 3)

union{

    #declare X =  r * cos(pi * T);
    #declare Z =  r * sin(pi * T);


    //doutai  
    object{
    	sphere { <0,0,0> , 4}
    	pigment {color BrightGold}
    	scale < 0.6, 1, 0.7>
    }
    
      //te left
    object{
    	sphere { <-7.6,-1.5,0> , 2}
    	pigment {color BrightGold}
    	scale <0.3, 1.05, 0.8>
    	//rotate <0, 0, -30>
    	translate <-0.2, -1, 0>
    	rotate<0, 0,  -PHI*10>
    }

    //te fight
    object{
    	sphere { <7.6,-1.5,0> , 2}
    	pigment {color BrightGold}
    	scale <0.3, 1.05, 0.8>
    	//rotate <0, 0, 30>
    	translate <0.2, -1, 0>
    	rotate<0, 0,  PHI*10>
    }

union{

    //shirome left
    object{
    	sphere {<-1, 2.5, -1.9>, 0.5}
    	pigment {color White}  		
    }

    //kurome left
    object{
    	sphere {<-1.1, 2.6, -2.3>, 0.15}
    	pigment {color Black}
    }


    //shirome right
    object{
    	sphere {<1, 2.5, -1.9>, 0.5}
    	pigment {color White}
    		
    }

    //kurome right
    object{
    	sphere {<1.1, 2.6, -2.3>, 0.15}
    	pigment {color Black}
    }

    //kuti
    object{
    	sphere { <0, 2.3, -1.1>, 1}
    	pigment {color Orange}
    	scale <1.4, 0.65, 1.4>
    }
    
    rotate < 0, 360 * clock , 0>
    
}



    //happa
    object{
    	sphere { <0,19.5,0> , 1.5}
    	pigment {color ForestGreen}
    	scale <1, 0.2, 1>
    }

    object{
    	sphere { <-6, 5, 0> , 1}
    	pigment {color ForestGreen}
    	scale <0.15, 0.8, 0.15>
    	rotate <0, 0, -15>
    }

    translate <X, 0, Z>
    //rotate < 0, 360 * clock , 0>
    rotate < 0, 0, 0>

}



#declare T = T + 0.2;
#end


