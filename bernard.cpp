#include <iostream>
#include <cmath>
#include <locale.h>
#include <windows.h>
using namespace std;

int main()
{
    cout << "Hello world!" << endl;

SetConsoleCP(1251);// установка кодовой страницы win-cp 1251 в поток ввода
SetConsoleOutputCP(1251); // установка кодовой страницы win-cp 1251 в поток вывода

    cout<<endl<<"это зависимые выборки ";

        //первый массив
      int n; float* matr1;
      cout<<"enter n of your mass ";
      cin>>n;

      matr1= new float [n];int i;
      cout<<endl<<"enter your 1 massiv "<<endl;
      for (i=0;i<n;i++)
      {cin>>matr1[i];}

        //второй массив
      float* matr2;


      matr2= new float [n];
      cout<<endl<<"enter your 2 massiv "<<endl;
      for (i=0;i<n;i++)
      {cin>>matr2[i];}

        //массив d
        float * d; float * d2;
        d=new float [n]; d2= new float [n]; float dsrc;dsrc=0;float dsrc2; dsrc2=0;
        for(i=0;i<n;i++)
        {d[i]=matr1[i]-matr2[i];
         d2[i]=d[i]*d[i];
         dsrc+=d[i];
         dsrc2+=d2[i];
        }


        float dsr;dsr=dsrc/n;

        float s2ind;
         s2ind= ((n*dsrc2)-(dsrc*dsrc))/(n*(n-1));
        float sind; sind=sqrt(s2ind);

        cout<<"средняя от разницы "<<dsr<<endl<<
        "испрдисп от нее "<<s2ind<<endl<<
        "среднеквотккл от нее "<<sind<<endl;

        float  t; float nn;nn=n*1.0;
        t=dsr*sqrt(nn)/sind;
        cout<<"Тст набл = "<<t;

        cout<<endl<<"d[i]: ";
        for(i=0;i<n;i++)
        {cout<<d[i]<<" ";

        }

        //что делать с критерием бернарда
        float *tber;
         tber=new float [n];
        float * dsrcj;
        dsrcj=new float[n];
        float * dsrc2j;
        dsrc2j=new float [n];
        float * s2indj;
        s2indj=new float [n];
        float * sindj;
        sindj=new float [n];

        tber[0]=0;int m;
        dsrcj[0]=0;
        dsrc2j[0]=0;
        s2indj[0]=0;
        sindj[0]=0;
        cout<<endl<<"kriterii bernarda "<<endl;
        for(m=2;m<=n;m++)
        {

            for(i=0;i< m;i++)
            {dsrcj[m-1]+=d[i];
         dsrc2j[m-1]+=d2[i];

            }
          s2indj[m-1]= ((m*dsrc2j[m-1])-(dsrcj[m-1]*dsrcj[m-1]))/(m*(m-1));
          sindj[m-1]=sqrt(s2indj[m-1]);
          tber[m-1]=dsrcj[m-1]/sindj[m-1];
              cout<<m
        <<" "<<tber[m-1]<<" ";
        }








        delete [] matr1;
        delete [] matr2 ;
        delete [] d ;
        delete [] d2 ;
        delete [] tber;
        delete [] dsrcj;
        delete [] dsrc2j;
        delete [] s2indj;
        delete [] sindj;


    return 0;
}
