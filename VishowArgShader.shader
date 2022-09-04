Shader "Custom/VishowArgShader"
{

	SubShader
	{
		Pass
		{
			CGPROGRAM

			#include "UnityCG.cginc"

			#pragma vertex vert
			#pragma fragment frag

			struct v2f
			{
				float4 pos:SV_POSITION;
				fixed4 color:COLOR0;
			};

			v2f vert(appdata_full v)
			{
				v2f result;
				result.pos = UnityObjectToClipPos(v.vertex);
				result.color = fixed4(v.normal * 0.5 + fixed3(0.5,0.5,0.5), 1.0);//可视化法线方向
				result.color = fixed4(v.tangent.xyz * 0.5 + fixed3(0.5,0.5,0.5), 1.0);//可视化切线方向
				
				fixed3 bionormal = cross(v.normal, v.tangent.xyz) * v.tangent.w;
				result.color = fixed4(bionormal * 0.5 + fixed3(0.5,0.5,0.5), 1.0);//可视化副切线方向

				result.color = fixed4(v.texcoord.xy, 0.0,1.0);//可视化第一组纹理坐标
				result.color = fixed4(v.texcoord1.xy, 0.0,1.0);//可视化第二组纹理坐标

				result.color = frac(v.texcoord);//可视化第一组纹理坐标的小数部分
				if(any(saturate(v.texcoord) - v.texcoord)){
					result.color.b = 0.5;
				}
				result.color.a = 1.0;

				result.color = frac(v.texcoord1);//可视化第二组纹理坐标的小数部分
				if(any(saturate(v.texcoord1) - v.texcoord1)){
					result.color.b = 0.5;
				}
				result.color.a = 1.0;

				result.color = v.color;//可视化顶点颜色
				
				return result;
			}

			fixed4 frag(v2f i):SV_Target
			{
				return i.color;
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}