import * as cdk from 'monocdk';
import * as ec2 from 'monocdk/aws-ec2';
import * as awsLambda from 'monocdk/aws-lambda';
import * as s3 from 'monocdk/aws-s3';
import * as awssecret from 'monocdk/aws-secretsmanager';
// eslint-disable-next-line @typescript-eslint/no-require-imports
const pjson = require('../package.json');

export interface FlywayConstructParams {
  readonly migrationDBSecretManager: awssecret.ISecret;
  readonly bucketMigrationSQL: s3.IBucket;
  readonly vpc?: ec2.IVpc;
  readonly subnet?: ec2.SubnetSelection;
  readonly securityGroups?: ec2.ISecurityGroup[];
  readonly memorySize?: number;
  readonly timeout?: cdk.Duration;
  //add readonly bucketFolderPrefix? : string;
}

export class FlywayConstruct extends cdk.Construct {

  static readonly HANDLER = 'tech.necko.flywayjar.Main::handleRequest';
  static readonly ID_LAMBDA_CODE = 'bucketMigration';
  static readonly BUCKET_CODE_ARN = 'arn:aws:s3:::flywaymigrationconstruct-monocdk';
  objectCodeKey = pjson.version;
  flywayLambdaMigration: awsLambda.Function;

  constructor(scope: cdk.Construct,
    id: string,
    params: FlywayConstructParams,
  ) {
    super(scope, id);
    this.flywayLambdaMigration = new awsLambda.Function(this, id, {
      vpc: params.vpc,
      vpcSubnets: params.subnet,
      securityGroups: params.securityGroups,
      memorySize: params.memorySize || 512,
      timeout: params.timeout || cdk.Duration.seconds(30),
      handler: FlywayConstruct.HANDLER,
      runtime: awsLambda.Runtime.JAVA_11,
      environment: {
        //add PREFIX: params.bucketFolderPrefix || ''
        ARN: params.migrationDBSecretManager.secretArn,
        BUCKET_NAME: params.bucketMigrationSQL.bucketName,
      },
      code: awsLambda.S3Code.fromBucket(
        s3.Bucket.fromBucketArn(this, FlywayConstruct.ID_LAMBDA_CODE, FlywayConstruct.BUCKET_CODE_ARN), 'flywayjar.' + this.objectCodeKey + '.zip'),
    });
    params.migrationDBSecretManager.grantRead(this.flywayLambdaMigration);
    params.bucketMigrationSQL.grantRead(this.flywayLambdaMigration);
  }
}