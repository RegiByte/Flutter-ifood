function getHighlightsInfo() {
    const highlightsElements = Array.from(document.querySelectorAll('.highlights-carousel__wrapper .slick-slide'));

    const highlightsArray = highlightsElements.map(highlight => {
    	const picture = highlight.querySelector('img').src
    	const title = highlight.querySelector('.highlights-carousel__title').innerText
    	const tip = highlight.querySelector('.highlights-carousel__description').innerText

    	return {
    		title,
    		tip,
    		picture
        }
    });

    const uniqueHighlights = highlightsArray.reduce((highlights, highlight) => {
    	if (highlights.find(high => high.title === highlight.title)) {
    		return highlights
        }

    	return [
    		...highlights,
    		highlight
        ]
    }, []);

    return uniqueHighlights;
}