import * as monocdk from 'monocdk';
import {FlywayConstruct} from '../src';
import {expect, haveResource} from '@monocdk-experiment/assert';

test('test stack', () => {
  const app = new monocdk.App();
  const stack = new monocdk.Stack(app, 'Test');
  const bucket = new monocdk.aws_s3.Bucket(stack, 'bucket');
  const vpc = new monocdk.aws_ec2.Vpc(stack, 'vpc');
  const secret = new monocdk.aws_secretsmanager.Secret(stack, 'secret');
  const construct = new FlywayConstruct(stack, 'testConstruct', {
    migrationDBSecretManager: secret,
    bucketMigrationSQL: bucket,
  });
  expect(construct).to(haveResource('AWS::Lambda::Function'));
  expect(stack).to(haveResource('AWS::Lambda::Function'));
});