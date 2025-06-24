// Test file for GitHub label workflow validation
// This file tests path-based labeling for package: core

export const testLabelWorkflow = () => {
  console.log('Testing GitHub label workflow - package: core');
  return {
    package: 'core',
    expectedLabel: 'package: core',
    testDate: new Date().toISOString()
  };
};