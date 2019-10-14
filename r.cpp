#include <iostream>
#include <iomanip> //для сетвэ
#include <cmath>//for sqrt
using namespace std;
float sred(float * mass, int r);
float sronklb(float * mass, int r);
float sronkl(float * mass, int r);
float mxy (float * mass1,float * mass2,int r);
float sum(float *mass,int r);
int main()
{


    int n; cin>>n; int i;
float x[n];float y[n]; float xy[n];
cout<<" enter x";

for(i=0;i<n;i++)
{cin>>x[i];

}
cout<<endl<<"enter y";
for (i=0;i<n;i++)
{cin>>y[i];

}


for(i=0;i<n;i++)
{xy[i]=x[i]*y[i];

}

float w;
w=(n*sum(xy,n)-sum(y,n)-sum(x,n))/(n*n*sronkl(x,n)*sronkl(y,n));
cout<<" "<<sum(x,n);
cout<<" "<<sum(y,n);
cout<<" "<<w;


    return 0;
}
float sred(float * mass, int r)
{ float sr;
int i;sr=0;
 for(i=0;i<r;i++)
 {sr+=mass[i];

 }
 sr/=r;

 return sr;
}

float sronklb(float * mass,int r)
{
    float * m2;
    m2=new float [r];
    int i;

     for(i=0;i<r;i++)
    {m2[i]=mass[i]*mass[i];}

    float xm2,xm; xm=0.0; xm2=0.0;
    for (i=0;i<r;i++)
    { xm2+=m2[i];
    xm+=mass[i];

    }

    float s2;
     s2= ((r*xm2)-(xm*xm))/(r*(r-1));
    float s; s=sqrt(s2);
    //cout<<endl<<"sr= "<<xm/n;
    //cout<<endl<<" s = "<<s;

    delete [] m2;

return s;

}

/*float mxy (float * mass1,float * mass2,int r)
{float m;
m=0;
int i;
for(i=0;i<r;i++)
{m+=mass1[i]*mass2[i];

}
m/=r*r;
return m;

}*/
float sum(float * mass,int r)
{float s;
s=0;
int i;
for(i=0;i<r;i++)
    {s+=mass[i];

    }
    return(s);
}
float sronkl(float * mass,int r)
{
    float * m2;
    m2=new float [r];
    int i;

     for(i=0;i<r;i++)
    {m2[i]=mass[i]*mass[i];}

    float xm2,xm; xm=0.0; xm2=0.0;
    for (i=0;i<r;i++)
    { xm2+=m2[i];
    xm+=mass[i];

    }

    float s2;
     s2= (r*xm2-xm)/(r*r);
    float s; s=sqrt(s2);
    //cout<<endl<<"sr= "<<xm/n;
    //cout<<endl<<" s = "<<s;

    delete [] m2;

return s;

}
