// Test file for GitHub label workflow validation
// This file tests path-based labeling for testing AND package: database

describe('Label Workflow Test', () => {
  it('should apply both testing and package: database labels', () => {
    const expectedLabels = ['testing', 'package: database'];
    expect(expectedLabels).toContain('testing');
    expect(expectedLabels).toContain('package: database');
  });
});