//base shader 最基础的shader 返回白色
Shader "Custom/StructPropertyShader"
{

    Properties
    {
        _Color("Color tint", Color) = (1.0,1.0,1.0,1.0)
    }

	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag


            fixed4 _Color;

			struct a2v
			{
				//用模型空间的顶点坐标填充vertex变量
				float4 vertex:POSITION;
				//用模型空间的法线填充normal变量
				float3 normal:NORMAL;
				//用模型的第一套纹理坐标填充texcoord变量
				float texcoord:TEXCOORD0;
			};

            struct v2f
            {
                float4 pos:SV_POSITION;
                fixed3 color:COLOR0;
            };

			v2f vert(a2v v)
			{   
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.color = v.normal*0.5 + fixed3(0.5,0.5,0.5);
				return o;
			}

			fixed4 frag(v2f i):SV_Target
			{
                fixed3 c = i.color;
                c *= _Color.rgb;
				return fixed4(c,1.0);
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}