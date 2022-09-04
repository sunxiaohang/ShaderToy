//base shader 最基础的shader 返回白色
Shader "Custom/BashShader"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4 vert(float4 v:POSITION):SV_POSITION
			{
				return UnityObjectToClipPos(v);
			}

			fixed4 frag():SV_Target
			{
				return fixed4(1.0,1.0,1.0,1.0);
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}