// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/BaseShaderBack"
{
    SubShader
    {
        Tags{"Queue"="Transparent"}
        ZTest Greater
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
                return fixed4(0,0,1,1);
            }

            ENDCG
        }
    }
    Fallback "Diffuse"
}