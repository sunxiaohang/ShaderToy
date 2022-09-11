ShaderLab和CG变量类型的匹配关系

| ShaderLab属性类型 | Cg变量类型           |
| ----------------- | -------------------- |
| Color, Vector     | float4, half4,fiexd4 |
| Range, Float      | float, half, fixed   |
| 2D                | sampler2D            |
| Cube              | samplerCube          |
| 3D                | sampler3D            |


### 深度测试
ZTest LEqual「小于等于」 和 ZWrite On 是默认开启的
ZTest 可取值为：Greater , GEqual , Less , LEqual , Equal , NotEqual , Always , Never , Off，默认是 LEqual，
ZTest Off 等同于 ZTest Always。

