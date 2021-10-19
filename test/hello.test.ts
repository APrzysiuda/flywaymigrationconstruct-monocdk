import { expect, haveResource } from '@monocdk-experiment/assert';
import * as monocdk from 'monocdk';
import { FlywayConstruct } from '../src';

test('test stack', () => {
  const app = new monocdk.App();
  const stack = new monocdk.Stack(app, 'Test');
  const bucket = new monocdk.aws_s3.Bucket(stack, 'bucket');
  const secret = new monocdk.aws_secretsmanager.Secret(stack, 'secret');
  const construct = new FlywayConstruct(stack, 'testConstruct', {
    migrationDBSecretManager: secret,
    bucketMigrationSQL: bucket,
  });
  construct.flywayLambdaMigration;
  expect(stack).to(haveResource('AWS::Lambda::Function'));
});
