#include <iostream>
#include "math.h"
using namespace std;

int main()
{
    cout << "Hello world!" << endl;
    int * x;
    int * y;
    int ** matr; int nx;nx=5;
    int ny;ny=3;
    x=new int[nx]; int i;
    y=new int[ny];
cout<<"x: ";
    for (i=0;i<nx;i++)
    {x[i]=165+i*5;
cout<<x[i]<<" ";
    }
    cout<<endl;
 cout<<"y: ";
    for (i=0;i<ny;i++)
    {y[i]=85+i*10;
 cout<<y[i]<<" ";
    }

    matr=new int *[ny];
    for (int i=0; i<ny; i++)
         {matr[i] = new int [nx];}

    int j;

      for (i=0;i<ny;i++)
      {
            cout<<" enter "<<i<< " stroku "<<endl;
            for (j=0;j<nx;j++)
            { cin>>matr[i][j];

            }
      }
     cout<<"vvod okonchen ";

     for(i=0;i<ny;i++)
     {for(j=0;j<nx;j++)
         cout<<matr[i][j]<<" ";
     }


     int sxy;sxy=0;
     for (i=0;i<ny;i++)
     { int t;t=0;
         for(j=0;j<nx;j++)
     {
         t+=x[j]*matr[i][j];
         cout<<" ti="<<t;
     }
     sxy+=y[i]*t;
     }

     cout<<endl<<"sxy= "<<sxy<<endl;
     int sx;sx=0;
     for (i=0;i<nx;i++)
     {int ni;ni=0;
          for (j=0;j<ny;j++)

       {
          ni+=matr[i][j];

       }
       sx+=ni*x[i];
     }

     int sy;sy=0;
     for (j=0;j<ny;j++)
     {   int nj;nj=0;
         for (i=0;i<nx;i++)

       {
          nj+=matr[i][j];

       }
       cout<<"nj pri j "<<j<<" = "<<nj;
       sy+=nj*y[j];
     }

     cout<<"sx "<<sx<<endl;
     cout<<"sy "<<sy<<endl;

     int sx2; sx2=0;
     int sy2; sy2=0;
     for (i=0;i<nx;i++)
     {  int ni;ni=0;
         for (j=0;j<ny;j++)
       {
          ni+=matr[i][j];

       }
       sx2+=ni*x[i]*x[i];
     }

     for (j=0;j<ny;j++)
     { int nj;nj=0;
         for (i=0;i<nx;i++)

       {
          nj+=matr[i][j];

       }
       sy2+=nj*y[j]*y[j];
     }

     cout<<"sy2 "<<sy2<<endl;
     cout<<"sx2 "<<sx2<<endl;

     int ssx; ssx=sx*sx; cout<<"sx*sx "<<ssx<<endl;
     int ssy; ssy=sy*sy; cout<<"sy*sy "<<ssy<<endl;
      int n;n=0;
     for (i=0;i<ny;i++)
     { for (j=0;j<nx;j++)
         {
            n+=matr[i][j];
         }
     }
      cout<<"n "<<n<<endl;
     float r;
     float ch; ch=(n*sxy-sx*sy);
     cout<<"ch "<<ch<<endl;
     float zn; zn=sqrt((n*sx2-ssx)*(n*sy2-ssy));
     cout<<"zn "<<zn<<endl;

     r=ch/zn;
     cout<<"r = "<<r<<endl;


    return 0;
}
