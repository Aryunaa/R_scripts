#include <iostream>
#include <locale.h>
#include <windows.h>
#include <cmath>
using namespace std;

int main()
{  SetConsoleCP(1251);// ��������� ������� �������� win-cp 1251 � ����� �����
SetConsoleOutputCP(1251); // ��������� ������� �������� win-cp 1251 � ����� ������


    //������ � ������ ��������.
     int n1; float* matr1; float* m21;
   cout<<"enter n1 of your first mass ";
   cin>>n1;

    matr1= new float [n1]; m21= new float[n1];int i;
    cout<<endl<<"enter your massiv "<<endl;
   for (i=0;i<n1;i++)
    {cin>>matr1[i];

    }

   for(i=0;i<n1;i++)
    {m21[i]=matr1[i]*matr1[i];

    }

   float xm2in1,xmin1; xmin1=0.0; xm2in1=0.0;
    for (i=0;i<n1;i++)
    { xm2in1+=m21[i];
    xmin1+=matr1[i];

    }

    float s2in1;
     s2in1= ((n1*xm2in1)-(xmin1*xmin1))/(n1*(n1-1));
   float sin1; sin1=sqrt(s2in1);
   float sr1;sr1=xmin1/n1;

   //����������� �� ������

    int n2; float* matr2; float* m22;
   cout<<"enter n1 of your second mass ";
   cin>>n2;

    matr2= new float [n2]; m22= new float[n2];
    cout<<endl<<"enter your massiv "<<endl;
   for (i=0;i<n2;i++)
    {cin>>matr2[i];

    }

   for(i=0;i<n2;i++)
    {m22[i]=matr2[i]*matr2[i];

    }

   float xm2in2,xmin2; xmin2=0.0; xm2in2=0.0;
    for (i=0;i<n2;i++)
    { xm2in2+=m22[i];
    xmin2+=matr2[i];

    }

    float s2in2;
     s2in2= ((n2*xm2in2)-(xmin2*xmin2))/(n2*(n2-1));
   float sin2; sin2=sqrt(s2in2);
   float sr2;sr2=xmin2/n2;


    //������� ��� ������
       cout<<"������� ������ ��������� ���� ������� "<<sr1<<endl<<
       "������� ������ ��������� ������� "<<sr2<<endl<<

       "��������� ������������ ������ ��������� ������� "<<s2in1<<endl<<
       "��������� ������������ ������ ��������� ������� "<<s2in2<<endl<<

       "������������������� ���� ��� "<<sin1<<endl<<
       "������������������� ������ ��� "<<sin2<<endl;

   //����������, ��� � ��������� �� ���������
   float FS;
   if (s2in1>s2in2)
   {


       cout<<" ��������� ������ ��������� ���� ������� ������.";
       FS=s2in1/s2in2;
       cout<<"F����= "<<FS;
   }

   else
   { cout<<" ��������� ������ ��������� ���� ������� ������. ";
     FS=s2in2/s2in1;
     cout<<"F����= "<<FS;

   }


   delete []matr1;
   delete []matr2;
   delete []m21;
   delete []m22;
    return 0;
}
