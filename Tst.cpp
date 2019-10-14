#include <iostream>
#include <cmath>
#include <locale.h>
#include <windows.h>
using namespace std;

int main()
{SetConsoleCP(1251);// установка кодовой страницы win-cp 1251 в поток ввода
SetConsoleOutputCP(1251); // установка кодовой страницы win-cp 1251 в поток вывода


    //  логика
    cout<<"если это одна выборка, введите русское маленькое 'о'. если их две, любой другой символ "<<endl;
    char c;
    cin>>c;
    if (c=='o')
    {
        int n; float*matr; float* m2;

    cout << "enter n" << endl;
    cin>>n;
     matr= new float [n]; m2= new float[n];int i;
    cout<<endl<<"enter your massiv "<<endl;
    float a0; cout<<endl<<" enter your a0 "; cin>>a0;
    for (i=0;i<n;i++)
    {cin>>matr[i];

    }

    for(i=0;i<n;i++)
    {m2[i]=matr[i]*matr[i];

    }
    float xm2,xm; xm=0.0; xm2=0.0;
    for (i=0;i<n;i++)
    { xm2+=m2[i];
    xm+=matr[i];

    }

    float s2;
     s2= ((n*xm2)-(xm*xm))/(n*(n-1));
    float s; s=sqrt(s2);float sr; sr=xm/n; float nn;nn=n*1.0;
    cout<<endl<<"sr= "<<sr;
    cout<<endl<<" s = "<<s;
    cout<<endl<<"s2 = "<<s2;


    float t;
    t=(sr-a0)*sqrt(nn)/s;
    cout<<"Tstnabl= "<<t;

    delete [] matr;
    delete [] m2;


    }

    if (c!='о')
    { char p;
    cout<<endl<<"если это независимые выборки, введите 'н' ";
    cin>>p;
    if(p=='н')
    {//решаем с первым массивом.
      int n1; float* matr1; float* m21;
      cout<<"enter n1 of your first mass ";
      cin>>n1;

      matr1= new float [n1]; m21= new float[n1];int i;
      cout<<endl<<"enter your massiv "<<endl;
      for (i=0;i<n1;i++)
      {cin>>matr1[i];}

      for(i=0;i<n1;i++)
      {m21[i]=matr1[i]*matr1[i];}

       float xm2in1,xmin1; xmin1=0.0; xm2in1=0.0;
       for (i=0;i<n1;i++)
        { xm2in1+=m21[i];
         xmin1+=matr1[i];
         }

      float s2in1;
      s2in1= ((n1*xm2in1)-(xmin1*xmin1))/(n1*(n1-1));
      float sin1; sin1=sqrt(s2in1);
      float sr1;sr1=xmin1/n1;

    //разбираемс€ со второй

      int n2; float* matr2; float* m22;
      cout<<"enter n1 of your second mass ";
      cin>>n2;

      matr2= new float [n2]; m22= new float[n2];
      cout<<endl<<"enter your massiv "<<endl;
      for (i=0;i<n2;i++)
      {cin>>matr2[i];}

      for(i=0;i<n2;i++)
      {m22[i]=matr2[i]*matr2[i];}

       float xm2in2,xmin2; xmin2=0.0; xm2in2=0.0;
       for (i=0;i<n2;i++)
       { xm2in2+=m22[i];
        xmin2+=matr2[i];

        }

         float s2in2;
         s2in2= ((n2*xm2in2)-(xmin2*xmin2))/(n2*(n2-1));
        float sin2; sin2=sqrt(s2in2);
         float sr2;sr2=xmin2/n2;


    //выведем все данные
       cout<<"средн€€ первой введенной вами выборки "<<sr1<<endl<<
       "средн€€ второй введенной выборки "<<sr2<<endl<<

       "дисперси€ исправленна€ первой введенной выборки "<<s2in1<<endl<<
       "дисперси€ исправленна€ второй введенной выборки "<<s2in2<<endl<<

       "среднеквадратичоткл перв выб "<<sin1<<endl<<
       "среднеквадратичоткл второй выб "<<sin2<<endl;


     float t;
     float a;
     a=(sr1-sr2)/sqrt(s2in1*(n1-1)+s2in2*(n2-1));
     float b;
     b=sqrt(n1*n2*(n1+n2-2)/(n1+n2));
     t=a*b;
     cout<<"Tstнабл= "<<t;


   delete [] matr1 ;
   delete [] matr2 ;
   delete [] m21 ;
   delete [] m22 ;


    }

    else
    {
        cout<<endl<<"это зависимые выборки ";

        //первый массив
      int n; float* matr1;
      cout<<"enter n of your first mass ";
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

        cout<<"средн€€ от разницы "<<dsr<<endl<<
        "испрдисп от нее "<<s2ind<<endl<<
        "среднеквотккл от нее "<<sind<<endl;

        float t; float nn;nn=n*1.0;
        t=dsr*sqrt(nn)/sind;
        cout<<"“ст набл = "<<t;

        delete [] matr1;
        delete [] matr2 ;
        delete [] d ;
        delete [] d2 ;

    }


   }


    return 0;
}
