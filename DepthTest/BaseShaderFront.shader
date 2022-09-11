// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/BaseShaderFront"
{
    SubShader
    {
        Tags{"Queue"="Transparent-1"}
        // ZWrite Off

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 vert(float4 v:POSITION):SV_POSITION
            {
                return UnityObjectToClipPos(v);
            }

            fixed4 frag():SV_Target
            {
                return fixed4(1,0,0,0.6);
            }

            ENDCG
        }
    }
    Fallback "Diffuse"
}