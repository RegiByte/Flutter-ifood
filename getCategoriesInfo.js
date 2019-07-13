function getCategoriesInfo() {
    const categoryElements = Array.from(document.querySelectorAll('.cuisine-item'));
    const categoryArray = categoryElements.map(category => {
    	const picture = category.querySelector('img').src
    	const name = category.querySelector('.cuisine-item__title').innerText

    	return {
    		picture,
    		name
    	}
    });

    const uniqueCategories = categoryArray.reduce((categories, category) => {
        if (categories.find(cat => cat.name === category.name)) return categories

        return [
            ...categories,
            category
          ]
        }, []);

    return uniqueCategories;
}