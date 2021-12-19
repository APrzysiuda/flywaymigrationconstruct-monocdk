# API Reference <a name="API Reference"></a>

## Constructs <a name="Constructs"></a>

### FlywayConstruct <a name="flywaymigrationconstructmonocdk.FlywayConstruct"></a>

#### Initializers <a name="flywaymigrationconstructmonocdk.FlywayConstruct.Initializer"></a>

```typescript
import { FlywayConstruct } from 'flywaymigrationconstructmonocdk'

new FlywayConstruct(scope: Construct, id: string, params: FlywayConstructParams)
```

##### `scope`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstruct.parameter.scope"></a>

- *Type:* [`monocdk.Construct`](#monocdk.Construct)

---

##### `id`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstruct.parameter.id"></a>

- *Type:* `string`

---

##### `params`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstruct.parameter.params"></a>

- *Type:* [`flywaymigrationconstructmonocdk.FlywayConstructParams`](#flywaymigrationconstructmonocdk.FlywayConstructParams)

---



#### Properties <a name="Properties"></a>

##### `flywayLambdaMigration`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstruct.property.flywayLambdaMigration"></a>

```typescript
public readonly flywayLambdaMigration: Function;
```

- *Type:* [`monocdk.aws_lambda.Function`](#monocdk.aws_lambda.Function)

---

##### `objectCodeKey`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstruct.property.objectCodeKey"></a>

```typescript
public readonly objectCodeKey: any;
```

- *Type:* `any`

---

#### Constants <a name="Constants"></a>

##### `BUCKET_CODE_ARN` <a name="flywaymigrationconstructmonocdk.FlywayConstruct.property.BUCKET_CODE_ARN"></a>

- *Type:* `string`

---

##### `HANDLER` <a name="flywaymigrationconstructmonocdk.FlywayConstruct.property.HANDLER"></a>

- *Type:* `string`

---

##### `ID_LAMBDA_CODE` <a name="flywaymigrationconstructmonocdk.FlywayConstruct.property.ID_LAMBDA_CODE"></a>

- *Type:* `string`

---

## Structs <a name="Structs"></a>

### FlywayConstructParams <a name="flywaymigrationconstructmonocdk.FlywayConstructParams"></a>

#### Initializer <a name="[object Object].Initializer"></a>

```typescript
import { FlywayConstructParams } from 'flywaymigrationconstructmonocdk'

const flywayConstructParams: FlywayConstructParams = { ... }
```

##### `bucketMigrationSQL`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.bucketMigrationSQL"></a>

```typescript
public readonly bucketMigrationSQL: IBucket;
```

- *Type:* [`monocdk.aws_s3.IBucket`](#monocdk.aws_s3.IBucket)

---

##### `migrationDBSecretManager`<sup>Required</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.migrationDBSecretManager"></a>

```typescript
public readonly migrationDBSecretManager: ISecret;
```

- *Type:* [`monocdk.aws_secretsmanager.ISecret`](#monocdk.aws_secretsmanager.ISecret)

---

##### `memorySize`<sup>Optional</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.memorySize"></a>

```typescript
public readonly memorySize: number;
```

- *Type:* `number`

---

##### `securityGroups`<sup>Optional</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.securityGroups"></a>

```typescript
public readonly securityGroups: ISecurityGroup[];
```

- *Type:* [`monocdk.aws_ec2.ISecurityGroup`](#monocdk.aws_ec2.ISecurityGroup)[]

---

##### `subnet`<sup>Optional</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.subnet"></a>

```typescript
public readonly subnet: SubnetSelection;
```

- *Type:* [`monocdk.aws_ec2.SubnetSelection`](#monocdk.aws_ec2.SubnetSelection)

---

##### `timeout`<sup>Optional</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.timeout"></a>

```typescript
public readonly timeout: Duration;
```

- *Type:* [`monocdk.Duration`](#monocdk.Duration)

---

##### `vpc`<sup>Optional</sup> <a name="flywaymigrationconstructmonocdk.FlywayConstructParams.property.vpc"></a>

```typescript
public readonly vpc: IVpc;
```

- *Type:* [`monocdk.aws_ec2.IVpc`](#monocdk.aws_ec2.IVpc)

---



