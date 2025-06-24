// Test file for GitHub label workflow validation
// This file tests path-based labeling for app: api

export const testLabelWorkflowApi = () => {
  console.log('Testing GitHub label workflow - app: api');
  return {
    app: 'api',
    expectedLabel: 'app: api',
    testDate: new Date().toISOString()
  };
};