const RESULT_LINK = 'h3';

class GoogleResultsPage {
  static expect() {
    return {
      toHaveResults: () => {
        cy.get(RESULT_LINK).its('length').then((length) => {
          expect(length).to.be.greaterThan(5);
        });
      },

      toHaveKeyResults: (key) => {
        cy.get(RESULT_LINK).first().invoke('text').then((val) => {
          expect(val).to.include(key);
        });
      },
    };
  }
}

export default GoogleResultsPage;
