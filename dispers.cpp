#include <iostream>

#include <cmath>

using namespace std;

int main()
{
    //float a ; a= (1.43-1.33)/sqrt(0.000333*3+9.9208e-005*2);
     //float b; b= sqrt(12.0*5/7);
    // cout<<a<<endl<<b<<endl;
    //cout<<a*b;




    int n; float*matr; float* m2;

    cout << "enter n" << endl;
    cin>>n;
     matr= new float [n]; m2= new float[n];int i;
    cout<<endl<<"enter your massiv "<<endl;

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
    float s; s=sqrt(s2);
    cout<<endl<<"sr= "<<xm/n;
    cout<<endl<<" s = "<<s;
    cout<<endl<<"s2 = "<<s2;
    delete [] matr;
    delete [] m2;











    return 0;
}
